import cv2

cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FPS, 12)
cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter_fourcc('M', 'J', 'P', 'G'))
width = 28
height = 28
cap.set(cv2.CAP_PROP_FRAME_WIDTH, width)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, height)
fps = int(cap.get(5))
print("fps:", fps)
it =0
while(cap.isOpened()):
    it +=1
    ret,frame = cap.read()
    if not ret:
        break
    cv2.imwrite('./photos/photo'+str(it)+'.jpg',frame)
    cv2.imshow('frame', frame)
    k = cv2.waitKey(1)
    if k == 27:
        break
