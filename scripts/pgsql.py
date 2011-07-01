#!/usr/bin/python 

from gzip import GzipFile as gz
import pg as pgsql
import sys
import traceback
import os
import random as rnd
import socket, struct
import numpy as np

sql_host = "localhost"
sql_user = "srikanth"
sql_passwd = open('pgpasswd_file').readline().split('\n')[0]
sql_db = "capetown"

def sqlconn():
  try:
    conn = pgsql.connect(dbname=sql_db,host=sql_host,user=sql_user,passwd=sql_passwd)
    #cursor = conn.cursor() 
  except:
    print "Could not connect to sql server"
    sys.exit()
  return conn

def run_insert_cmd(cmd,prnt=0):
  conn = sqlconn()
  #print cmd
  try:
    conn.query(cmd)
  except:
    print "Couldn't run %s\n"%(cmd)
    return 0 
  #cursor.fetchall()
  return 1 

def run_data_cmd(cmd,prnt=0):
  conn = sqlconn()
  res = ''
  if prnt == 1:
    print cmd
  try:
    res = conn.query(cmd)
  except:
    #print "Couldn't run %s\n"%(cmd)
    return 0 
  result = res.getresult()
  return result 
