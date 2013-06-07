#!/usr/bin/env python
import os
import sys
import subprocess as sub
import gzip as gz
import time
import pgsql as sql

conn = sql.sqlconn()
traceroutearr = {}

def get_fields(line):
  skey = ''
  if '/>' in line:
    skey = '/>'
  else:
    skey = '>'

  try:
    line = line.split('<')[1]
  except:
    return None
  line = line.split(skey)[0]
  line = line.replace("'","")
  line = line.replace('"','')
  val = line.split()
  return val

def get_measurement_params(fids,vals,arr):
  #print arr
  for fid in arr:
    fids.append(fid)
    vals.append(arr[fid])
  return fids,vals

def get_id_from_table(table,did,srcip,dstip,ts):
  tup = (srcip,dstip,ts)
  if did in traceroutearr:
    if tup in traceroutearr[did]:
      return traceroutearr[did][tup]
  if did not in traceroutearr:
    traceroutearr[did] = {}
  cmd = "SELECT encode(id,'escape') from %s where deviceid = '%s' \
and srcip = '%s' and dstip = '%s' and eventstamp = to_timestamp(%s)"%(table,did,srcip,dstip,ts)
  print cmd
  res = sql.run_data_cmd(cmd,conn=conn)
  #print res,str(res[0][0])
  traceroutearr[did][tup] = str(res[0][0])
  return traceroutearr[did][tup]

def modify_fid(fid,table):
  if fid == 'timestamp':
    return 'eventstamp'
  if table == 'traceroute_hops':
    if fid == 'id':
      return 'hop'
    if fid == 'tid':
      return 'id'

  if table == 'MEASUREMENTS':
    if fid == 'avg':
      return 'average'
    if fid == 'min':
      return 'minimum'
    if fid == 'max':
      return 'maximum'
    if fid == 'med':
      return 'median'
  return fid

def modify_val(fid,val):
  nval = val
  if val == '':
    nval = 'NULL'
  nval = "'" + val + "'"
  if fid  == 'timestamp':
    nval = 'to_timestamp(%s)'%(val)
  if fid  == 'deviceid':
    nval = "'%s'"%(val[-12:])
 #if fid in ['deviceid','param','tool']:
  #  nval = '"' + val + '"'
  #else:
    #if fid in ['srcip','dstip','ip']:
    #  nval = 'INET_ATON("' + val + '")'
  return nval

def get_tool_info(tool):
  cmd = 'select id from tools where tool = "%s"'%(tool)
  #res = sql.run_sql_cmd(cmd)
  #return int(res[0][0])
  #return 'asdasd'
  return tool
  
def form_insert_cmd(table,fids,vals):
  if table.lower() == 'measurements':
    tabfid = fids.index('param')
    ntab = '%s_%s'%(table.lower()[0],vals[tabfid].lower())
    fids.pop(tabfid)
    vals.pop(tabfid)
    toolind = fids.index('tool')
    tool = vals[toolind]
    toolid = get_tool_info(tool)
    fids[toolind] = 'toolid'
    vals[toolind] = toolid
  else:
    ntab = table
  cmd = 'INSERT into ' + ntab + '('
  if 'traceroute' not in table:
    cmd += 'exitstatus,'
  for fid in fids:
    fid = modify_fid(fid,table)
    cmd += fid + ","
  cmd = cmd[0:len(cmd)-1]
  cmd += ') SELECT '
  if 'traceroute' not in table:
    cmd += '0,'
  for val in vals:
    ind = vals.index(val)
    nval = modify_val(fids[ind],val)
    cmd += nval + ","
  cmd = cmd[0:len(cmd)-1]
  #print cmd
  return cmd

def get_uid(did,table):
  cmd = 'SELECT userid from ' + table + ' where '
  cmd += 'deviceid = "' + did + '"'
  #res = sql.run_data_cmd(cmd)
  #return str(res[0][0])
  return "NULL"

def write_block_v1_0(data,tables,log,file):
  if 'info' not in data:
    log.write('Error: No info field in %s\n'%(file))
    return
  flag = 0
  for tab in tables:
    if tab in data:
      flag = 1
      break
  if flag == 0:
    log.write('Error: No known fields in %s\n'%(file))
    return

  #print data
  for tab in tables:
    if tab in data:
      numrec = len(data[tab])
      for i in range(0,numrec):
        table = tables[tab]
        fids = []
        vals = []
        if tab != 'hop':
          fids,vals = get_measurement_params(fids,vals,data['info'][0])
        else:
          ttid = data[tab][i]['ttid']
          data[tab][i].pop('ttid')
          did = data['info'][0]['deviceid'][-12:]
          ts = data['traceroute'][ttid]['timestamp']
          srcip = data['traceroute'][ttid]['srcip']
          dstip = data['traceroute'][ttid]['dstip']
          tid = get_id_from_table(tables['traceroute'],did,srcip,dstip,ts)
          idtuple = {"tid":tid}
          fids,vals = get_measurement_params(fids,vals,idtuple)
        
        fids,vals = get_measurement_params(fids,vals,data[tab][i])
        cmd = form_insert_cmd(table,fids,vals)
        print cmd
        res = sql.run_insert_cmd(cmd,conn=conn,prnt=1)
        cnt = 0
        #while ((res == 0) and (cnt < 5)):
          #print "res ", res
          #time.sleep(.1)   
          #res = sql.run_insert_cmd(cmd)
          #cnt += 1
        #if res == 0:
          #log.write('Could not %s from %s\n'%(cmd,file))

def parse_block_v1_0(block,version,tables,log):
  data = {}
  for line in block:
    fields = get_fields(line)
    if fields == None:
      continue
    head = fields[0]
    if '/' in head:
      continue
    if head not in data:
      data[head] = []

    tuple = {}
    if head == 'hop':
      tuple['ttid'] = len(data['traceroute']) -1
    for field in fields[1:]:
      field = field.split("=")
      name = field[0]
      val = field[1]
      tuple[name] = val
      #val = field[1].split('"')[1]
      #print name,":", val, ",",
    #print ''
    data[head].append(tuple)
  return data

def parse_block_v1_1(block,version,tables,log):
  data = parse_block_v1_0(block,version,tables,log)
  return data

def parse_block(block,version,tables,log,file):
  if version == '1.0':
    data = parse_block_v1_0(block,version,tables,log)
    write_block_v1_0(data,tables,log,file)
  if version == '1.2' or version == '1.3':
    data = parse_block_v1_1(block,version,tables,log)
    did = data['info'][0]['deviceid']
    write_block_v1_0(data,tables,log,file)
  return True

def log_bad_block(log,block,file):
  log.write('Bad block in %s\n'%(file))
  for line in block:
    log.write('%s\n'%(line))

def parsefile(file,tables,log):
  start_block = '<measurements'
  end_block = '</measurements'
  fp = open(file)
  state = 0
  block = []
  version = 0
  for line in fp:
    if state == 0:
      if  start_block in line:
        state = 1
        val = get_fields(line)
        version = val[1].split("=")[1]#.split('"')[1]
        print version
      continue

    if state == 1:
      if end_block in line:
        stat = parse_block(block,version,tables,log,file)
        if stat == False:
          log_bad_block(log,block,file)
        state = 0
        block = []
        continue
      block.append(line)

def move_file(file,dir):
  cmd = ['gzip',file]
  sub.Popen(cmd).communicate()
  zfile = file + '.gz'
  cmd = ['mv',zfile,dir]
  sub.Popen(cmd).communicate()

def ignore_file(file):
  if '.xml' not in file:
    return True
  if 'OW' not in file:
    return True
  if 'OW_' in file:
    return True
  return False

if __name__ == '__main__':
  HOME = os.environ['HOME'] + '/' #research/bismark/db/bismark/'
  #HOME = '/tmp/bismark_test/'
  MEASURE_FILE_DIR = 'var/data/'
  LOG_DIR = 'var/log/'
  ARCHIVE_DIR = 'var/archive/openwrt'
  FILE_LOG = LOG_DIR + 'xml_openwrt_parse_files'
  tables = {'measurement':'MEASUREMENTS','traceroute':'traceroutes','hop':'traceroute_hops'}

  filelog = open(HOME+FILE_LOG,'w')
  log = gz.open(HOME+LOG_DIR+'insert.log.gz','ab')
  files = os.listdir(HOME+MEASURE_FILE_DIR)
  fcnt = 0
  for file in files:
    if ignore_file(file) == True:
      continue
    else:
      filelog.write("%s\n"%(file))
    print file
    fcnt += 1
    parsefile(HOME+MEASURE_FILE_DIR+file,tables,log)
    log.write('Done ' + file + '\n')
    move_file(HOME+MEASURE_FILE_DIR+file,HOME+ARCHIVE_DIR)
    if fcnt < -1:
      sys.exit()
  log.close()
  filelog.close()

