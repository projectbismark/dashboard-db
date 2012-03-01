#!/usr/bin/python 

from gzip import GzipFile as gz
import pg as pgsql
import sys
import traceback
import os
import random as rnd
import socket, struct
import numpy as np

sql_host = open('pghost_file').readline().split('\n')[0]
sql_user = open('pguser_file').readline().split('\n')[0]
sql_passwd = open('pgpasswd_file').readline().split('\n')[0]
sql_db = open('pgdb_file').readline().split('\n')[0]

def sqlconn():
  try:
    conn = pgsql.connect(dbname=sql_db,host=sql_host,user=sql_user,passwd=sql_passwd)
    #cursor = conn.cursor() 
  except:
    print "Could not connect to sql server"
    sys.exit()
  return conn

def run_insert_cmd(cmd,conn=None,prnt=0):
  if conn == None:
    conn = sqlconn()
  #print cmd
  try:
    conn.query(cmd)
  except:
    print "Couldn't run %s\n"%(cmd)
    return 0 
  #cursor.fetchall()
  return 1 

def run_data_cmd(cmd,conn=None,prnt=0):
  if conn == None:
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
