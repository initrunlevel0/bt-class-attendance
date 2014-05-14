import bluetooth
import MySQLdb
import datetime


def getCurrenTimeSQLFriendly():
    f = '%Y-%m-%d %H:%M:%S'
    now = datetime.datetime.now()
    return now.strftime(f)

def doBluetoothPresenceCheck():
    while True:
        #try:
        con = MySQLdb.connect("127.0.0.1", "root", "", "test")
        cur = con.cursor()
        print "Finding nearby devices"
        nearby_devices = bluetooth.discover_devices(lookup_names = True)
        for bdaddr, name in nearby_devices:
            print "Found " + name + " with address " + bdaddr
            cur.execute("UPDATE mahasiswa SET present='" + getCurrenTimeSQLFriendly() + "' WHERE bt_addr='" + bdaddr + "'")
        con.commit()
        if con:
            con.close()
        #except:
           #pass

doBluetoothPresenceCheck()
if(con):
    con.close()
