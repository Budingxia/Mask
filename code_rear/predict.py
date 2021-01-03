#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import cv2
import time
import numpy as np
from yolo import YOLO
from PIL import Image


# In[ ]:


#-------------------------------------#
#       对单张图片进行预测
#-------------------------------------#
def detect_image(image_path):
    print('Start detect!')
    yolo = YOLO()
    try:
        image = Image.open(image_path)
    except:
        print('Open Error! Try again!')
        pass
    else:
        r_image = yolo.detect_image(image)
        r_image.save(image_path.split('.')[0] + '_result.png')
    print('Finish detect!')


# In[ ]:


#-------------------------------------#
#       对一段视频进行检测
#-------------------------------------#
def detect_video(video_path):
    print('Start detect!')
    yolo = YOLO()
    capture = cv2.VideoCapture(video_path)
    writer = None
    fps = 0.0
    while True:
        t1 = time.time()
        # 读取某一帧
        grabbed, frame = capture.read()
        if not grabbed:
            break
        # opencv读取的是BGR，格式转变，BGRtoRGB
        frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        # 转变成Image
        frame = Image.fromarray(np.uint8(frame))
        # 进行检测
        frame = np.array(yolo.detect_image(frame))
        # RGBtoBGR满足opencv显示格式
        frame = cv2.cvtColor(frame,cv2.COLOR_RGB2BGR)

        fps  = (fps + (1. / (time.time() - t1))) / 2
        print("FPS: %.2f" % (fps))
        frame = cv2.putText(frame, "FPS: %.2f" % (fps), (0, 40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2, cv2.LINE_AA)
        
        if writer is None:
            fourcc = cv2.VideoWriter_fourcc(*'MP4V')
            writer = cv2.VideoWriter(video_path.split('.')[0] + '_result.mp4', fourcc, 30, (frame.shape[1], frame.shape[0]), True)
        writer.write(frame)
    writer.release()
    capture.release()
    print('Finish detect!')


# In[ ]:


detect_image('1.jpg')


# In[ ]:


detect_video('testVideo.mp4')


# In[ ]:





# In[ ]:




