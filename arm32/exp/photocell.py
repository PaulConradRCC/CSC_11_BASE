import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(29,GPIO.IN)

while(1==1):
	print GPIO.input(29)
