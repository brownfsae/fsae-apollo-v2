import sys
import serial

from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QTimer

from time import strftime, localtime

app = QApplication([])
engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load("main.qml")

ser = serial.Serial('/dev/tty.usbmodem107509701', 9600) #/dev/ttyACM0

# Property indexes
coolantTemp = 1
oilPressure = 2
batteryVoltage = 3
lambdaValue = 4
engineSpeed = 5
throttlePos = 6
wheelL = 7
wheelR = 7

if(engine.rootObjects()):
    def update_time():
        # Pass the current time to QML.
        curr_time = strftime("%H:%M:%S", localtime())
        engine.rootObjects()[0].setProperty('currTime', curr_time)


        # Get the data from the serial link
        package = ''
        try:
            package = ser.readline()
        except:
            print("Error with package")
            return
        numbers = package.decode().split(',')
        
        if (len(numbers) == 8):
            engine.rootObjects()[0].setProperty('coolantTemp', numbers[coolantTemp])
            engine.rootObjects()[0].setProperty('oilPressure', numbers[oilPressure])
            engine.rootObjects()[0].setProperty('batteryVoltage', numbers[batteryVoltage])
            engine.rootObjects()[0].setProperty('lambdaValue', numbers[lambdaValue])
            engine.rootObjects()[0].setProperty('engineSpeed', numbers[engineSpeed])
        else:
            return

    timer = QTimer()
    timer.setInterval(100)  # msecs 100 = 1/10th sec
    timer.timeout.connect(update_time)
    timer.start()

    update_time()
sys.exit(app.exec())