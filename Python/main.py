import matplotlib
matplotlib.use('tkagg')
matplotlib.rc('image', cmap='gray')

import cv2
import numpy as np
import matplotlib.pyplot as plt



image = cv2.imread('carine.jpg')

# COLOR_BGR2RGB
# COLOR_BGR2GRAY
image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

def on_change(value):
    return value

cv2.namedWindow("output", cv2.WINDOW_NORMAL)

Sobel_up = np.array([[-1,-2,-1],
                     [0,0,0],
                     [1,2,1]])

Sobel_down = np.array([[-1,0,-1],
                       [-2,0,-2],
                       [-1,0,-1]])

# Gx = cv2.filter2D(image, -1, Sobel_up)
# Gy = cv2.filter2D(image, -1, Sobel_down)
# img = Gx**2 + Gy**2

kernel = np.array([[0,1,0],[1,1,1],[0,1,0]], np.uint8)

erosion = cv2.morphologyEx(image, cv2.MORPH_GRADIENT, kernel,iterations = 10)
img = erosion

plt.figure(figsize=(11,7))
plt.axis('off')
plt.imshow(img)
plt.show()
