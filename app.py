from flask import Flask, render_template, copy_current_request_context
from flask.ext.socketio import SocketIO, emit
import MySQLdb
import datetime

con = MySQLdb.connect("127.0.0.1", "root", "", "test")
cur = con.cursor()

app = Flask(__name__)
app.debug = True

socketio = SocketIO(app)


def clearAttendeeList():
    cur.execute("UPDATE mahasiswa SET present=0")
    con.commit()

def getData():
    cur.execute("SELECT * FROM mahasiswa")
    result = cur.fetchall()
    con.commit()
    result_return = []
    for row in result:
        data = list(row)
        if(data[3] != None):
            if(data[3] <= getKelasSaatIni()[2]):
                data[3] = 'Belum Dimulai'
            else:
                if(data[3] <= getKelasSaatIni()[4]):
                    delta = data[3] - getKelasSaatIni()[2]
                    data[3] = "Hadir Tepat Waktu"
                else:
                    delta = data[3] - getKelasSaatIni()[4]
                    data[3] = "Terlambat +" + str(delta.seconds / 60) + " menit"

        else:
            data[3] = "Belum Dimulai"

        result_return.append(data)


    return result_return

def getCurrenTimeSQLFriendly():
    f = '%Y-%m-%d %H:%M:%S'
    now = datetime.datetime.now()
    return now.strftime(f)

def getKelasSaatIni():
    cur.execute("SELECT * FROM kelas WHERE mulai <='" + getCurrenTimeSQLFriendly() +"' AND selesai >= '" + getCurrenTimeSQLFriendly() + "'")
    print("SELECT * FROM kelas WHERE mulai <='" + getCurrenTimeSQLFriendly() +"'' AND selesai >= '" + getCurrenTimeSQLFriendly() + "'")
    return cur.fetchone()

## WEB APPLICATIONS ##
@app.route("/")
def mainPage():
    return render_template('index.html')

@socketio.on('connect', namespace='/sock')
def onSocketConnect():
    emit("retrData", getData())

@socketio.on('check', namespace='/sock')
def onCheck():
    emit("retrData", getData())

@socketio.on('clearData', namespace='/sock')
def onClearData():
    clearAttendeeList()
    emit("retrData", getData())

@socketio.on('getClassData', namespace="/sock")
def onGetClassData():
    emit("retrClassData", getKelasSaatIni())

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0')
    if con:
        con.close()
