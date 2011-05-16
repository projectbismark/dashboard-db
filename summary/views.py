# Create your views here.

from django.http import HttpResponse
from django.shortcuts import render_to_response
from dashboard.summary.models import *
from pyofc2  import * 
import random
from datetime import datetime
from time import time

def index(request):
    return render_to_response('index.html')

def newuser(request):
    return render_to_response('newuser.html')
 
def adduser(request):
    return HttpResponse("new user added.")


def showdevices(request):
    device_list = Devices.objects.all()
    return render_to_response('devices.html', {'device_list': device_list})

def devicesummary(request, device):
    device_details = Devices.objects.filter(deviceid=device)
    return render_to_response('device.html', {'device_details': device_details})
    return HttpResponse(output)

def getISP(request,device):
    
    '''userdevice = Userdevice.objects.filter(deviceid=device)

    output=str(len(userdevice))
    for row in userdevice:
	output+ = str(row.userid)    '''
	
    return HttpResponse('comcast')

def cvs_linegraph(request, device):
    '''    
    chosen_param = request.POST.get('param')
    chosen_limit = request.POST.get('limit')
    timetype = request.POST.get('type')
    '''
    chosen_param = 'AGGL3BITRATE'
    chosen_limit = 100000
    timetype = 0

    end = time()
    start = 0 
    
    if timetype=='1':
	start = end - 3600*24
    if timetype=='3':
	start = end - 3600*24*7
    if timetype=='4':
	start = end - 3600*24*30
    if chosen_param == 'AGGL3BITRATE' :
	    

	    

	    device_details_down = Measurements.objects.filter(deviceid=device,param=chosen_param,timestamp__gt=start,avg__lte=chosen_limit,srcip=2413265837)
	    device_details_up = Measurements.objects.filter(deviceid=device,param=chosen_param,timestamp__gt=start,avg__lte=chosen_limit,dstip=2413265837)
	    
	    tim1 = list()
            dat1 = list()
            dat2 = list()
           
	    for measure in device_details_down:
		t = datetime.fromtimestamp(measure.timestamp)
		tim1.append(t.tm_wday*3600*34 + t.tm_hour*3600 + t.tm_min*60 + t.tm_sec)
		dat1.append(measure.avg)

	    for measure in device_details_up:
		dat2.append(measure.avg)

	    xVariable = "Date"
	    yVariable = "Down"
	    y2Variable = "Up"
	    output = xVariable + "," + yVariable + "," +  y2Variable +"\n"

	    for i in range(0,min(len(dat1),len(dat2))):
		ret = str(tim1[i]) + "," + str(dat1[i]) + "," + str(dat2[i]) + "\n"
		output += ret
    else:
	    device_details = Measurements.objects.filter(deviceid=device,param=chosen_param,timestamp__gt=start,avg__lte=chosen_limit)
	    xVariable = "Date"
	    yVariable = request.POST.get('unit')
	    output = xVariable + "," + yVariable +"\n"
	    for measure in device_details:
		t = datetime.fromtimestamp(measure.timestamp).strftime("%Y-%m-%d %H:%M:%S")
		ret = t + "," + str((measure.avg)) + "\n"
		output += ret

	

    return HttpResponse(output)


def pie_chart(request):
    t = title(text='Device Usage')
    l = pie()

    l.values = []
    for i in range(0,10):
	l.values.append(pie_value(value=i,label='hello '+str(i)))  
    
    chart = open_flash_chart()
    chart.title = t
    cols = ['#d01f3c','#356aa0','#C79810']
    chart.colours=cols
    chart.add_element(l)
    return HttpResponse(chart.render())

