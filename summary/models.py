# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class MeasurementsTmpl(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'measurements_tmpl'

class Ulrttup(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'ulrttup'

class Dnsdelay(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'dnsdelay'

class Dnsdelayc(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'dnsdelayc'

class Dnsdelaync(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'dnsdelaync'

class Tools(models.Model):
    id = models.TextField(primary_key=True) # This field type is a guess.
    tool = models.CharField(max_length=10)
    tool_desc = models.CharField(max_length=80)
    class Meta:
        db_table = u'tools'

class Sla(models.Model):
    id = models.TextField(primary_key=True) # This field type is a guess.
    isp = models.CharField(max_length=30)
    sla = models.CharField(max_length=50)
    dl = models.BigIntegerField()
    ul = models.BigIntegerField()
    class Meta:
        db_table = u'sla'

class Userdevice(models.Model):
    userid = models.TextField() # This field type is a guess.
    deviceid = models.TextField() # This field type is a guess.
    startdt = models.DecimalField(max_digits=20, decimal_places=0)
    enddt = models.DecimalField(max_digits=20, decimal_places=0)
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'userdevice'

class Devices(models.Model):
    deviceid = models.TextField(primary_key=True) # This field type is a guess.
    macid = models.TextField() # This field type is a guess.
    device_type = models.CharField(max_length=10)
    os = models.CharField(max_length=10)
    version = models.CharField(max_length=10)
    class Meta:
        db_table = u'devices'

class Users(models.Model):
    userid = models.TextField(primary_key=True) # This field type is a guess.
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=80)
    street = models.CharField(max_length=80)
    city = models.CharField(max_length=80)
    state = models.CharField(max_length=30)
    postalcode = models.CharField(max_length=30)
    country = models.CharField(max_length=2)
    phone = models.CharField(max_length=20)
    skype = models.CharField(max_length=80)
    sip = models.CharField(max_length=80)
    class Meta:
        db_table = u'users'

class Usersla(models.Model):
    userid = models.TextField() # This field type is a guess.
    slaid = models.TextField() # This field type is a guess.
    startdt = models.DecimalField(max_digits=20, decimal_places=0)
    enddt = models.DecimalField(max_digits=20, decimal_places=0)
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'usersla'

class Dnsfail(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'dnsfail'

class Dnsfailc(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'dnsfailc'

class Dnsfailnc(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'dnsfailnc'

class PgBuffercache(models.Model):
    bufferid = models.IntegerField()
    relfilenode = models.TextField() # This field type is a guess.
    reltablespace = models.TextField() # This field type is a guess.
    reldatabase = models.TextField() # This field type is a guess.
    relforknumber = models.SmallIntegerField()
    relblocknumber = models.BigIntegerField()
    isdirty = models.BooleanField()
    usagecount = models.SmallIntegerField()
    class Meta:
        db_table = u'pg_buffercache'

class Aggl3Bitrate(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'aggl3bitrate'

class Bitrate(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'bitrate'

class Capacity(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'capacity'

class Jitter(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'jitter'

class Lmrtt(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'lmrtt'

class Pktloss(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'pktloss'

class Rtt(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'rtt'

class Shaperate(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'shaperate'

class Ulrttdw(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    toolid = models.IntegerField()
    src = models.IPAddressField()
    dst = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    average = models.FloatField()
    std = models.FloatField()
    minimum = models.FloatField()
    maximum = models.FloatField()
    median = models.FloatField()
    iqr = models.FloatField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'ulrttdw'

class TracerouteHops(models.Model):
    tid = models.DecimalField(max_digits=11, decimal_places=0)
    hop_id = models.DecimalField(max_digits=11, decimal_places=0)
    ip = models.IPAddressField()
    rtt = models.FloatField()
    class Meta:
        db_table = u'traceroute_hops'

class Traceroutes(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    srcip = models.IPAddressField()
    dstip = models.IPAddressField()
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    hops = models.IntegerField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'traceroutes'

class ArpLogs(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    macid = models.TextField() # This field type is a guess.
    ip = models.IPAddressField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'arp_logs'

class Ip(models.Model):
    cip = models.TextField() # This field type is a guess.
    sip = models.IPAddressField()
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'ip'

class DhcpLogs(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    dhcp_action = models.CharField(max_length=20)
    ip = models.IPAddressField()
    macid = models.TextField() # This field type is a guess.
    client = models.CharField(max_length=255)
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'dhcp_logs'

class EventLogs(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    eventstamp = models.DecimalField(max_digits=20, decimal_places=0)
    eventid = models.DecimalField(max_digits=11, decimal_places=0)
    id = models.TextField(primary_key=True) # This field type is a guess.
    class Meta:
        db_table = u'event_logs'

class Events(models.Model):
    eventid = models.DecimalField(max_digits=11, decimal_places=0, primary_key=True)
    event = models.CharField(max_length=50)
    class Meta:
        db_table = u'events'

class WifiAssoc(models.Model):
    stationmac = models.TextField() # This field type is a guess.
    firstseen = models.DecimalField(max_digits=20, decimal_places=0)
    lastseen = models.DecimalField(max_digits=20, decimal_places=0)
    power = models.DecimalField(max_digits=11, decimal_places=0)
    numpkts = models.DecimalField(max_digits=11, decimal_places=0)
    bssid = models.TextField() # This field type is a guess.
    probedessid = models.CharField(max_length=32)
    deviceid = models.TextField() # This field type is a guess.
    class Meta:
        db_table = u'wifi_assoc'

class WifiScan(models.Model):
    deviceid = models.TextField() # This field type is a guess.
    bssid = models.TextField() # This field type is a guess.
    firstseen = models.DecimalField(max_digits=20, decimal_places=0)
    lastseen = models.DecimalField(max_digits=20, decimal_places=0)
    channel = models.SmallIntegerField()
    speed = models.DecimalField(max_digits=11, decimal_places=0)
    privacy = models.CharField(max_length=50)
    cipher = models.CharField(max_length=50)
    auth = models.CharField(max_length=50)
    power = models.DecimalField(max_digits=11, decimal_places=0)
    numbeacons = models.DecimalField(max_digits=11, decimal_places=0)
    numiv = models.DecimalField(max_digits=11, decimal_places=0)
    idlen = models.DecimalField(max_digits=11, decimal_places=0)
    essid = models.CharField(max_length=32)
    class Meta:
        db_table = u'wifi_scan'

