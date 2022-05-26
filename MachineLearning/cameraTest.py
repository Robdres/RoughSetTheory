# import the opencv library
import cv2
import matplotlib.pyplot as plt

cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter_fourcc('M', 'J', 'P', 'G')) # depends on fourcc available camera
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)
cap.set(cv2.CAP_PROP_FPS, 5)
it = 0 
ret, frame = vid.read()
if it == 0:
    img = frame
it +=1 

cv2.imshow('frame', frame)
print(img.shape)

