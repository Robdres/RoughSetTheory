# import the opencv library
import cv2
import matplotlib.pyplot as plt
  
# define a video capture object

vid = cv2.VideoCapture(0)
vid.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter_fourcc('M', 'J', 'P', 'G')) # depends on fourcc available camera
vid.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
vid.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)
vid.set(cv2.CAP_PROP_FPS, 5)
it = 0 
while(True):
      
    # Capture the video frame
    # by frame
    ret, frame = vid.read()
    if it == 0:
        img = frame
    it +=1 
  
    # Display the resulting frame
    cv2.imshow('frame', frame)
    # the 'q' button is set as the
    # quitting button you may use any
    # desired button of your choice
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
  


# After the loop release the cap object
vid.release()
# Destroy all the windows
cv2.destroyAllWindows()
print(img.shape)

