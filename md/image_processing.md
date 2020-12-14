---
title: Image processing
author: Louis Lesueur
---

## Pixel transforms

An image can be seen as a function:
$$
I: \mathcal{D} \rightarrow \mathcal{C}
$$

Where $\mathcal{D}$ is the domain ($\mathbb{R}^2$ for a continuous image, a grid of pixels for a difital picture). And $\mathcal{C}$ is a color-space.

### Some pixel transforms

|transform | formula | effect
|-|-|-|
|affine| $a I(x) + b$ | contrast and brightness (coarse)
|linar blend | $\alpha I_1(x) + (1-\alpha)I_2(x)$ | To perform transitions
|gamma correction | $I(x)^{\frac{1}{\gamma}}$ | To invert the gamma mapping applied by the sensor ($\gamma \simeq 2.2$ for a digital camera)

### Compositing and matting

Composition equation ($B$ is the background, $F$ the foreground and $\alpha$ the relative amount of opacity):
$$
C = (1-\alpha)B + \alpha F
$$

### Histogram

$$
H_I(i) = |\{x, I(x)=i\}|
$$

Cumulative

$$
C_I(i) = |\{x, I(x)<i\}|
$$

+ Histogram equalization: better to tune brightness and contrasts. Goal: find a mapping $f(I)$ such as its histogram is equalized. This is easy by remarking that $C_{f \circ I} = C_I \circ f^{-1}$

+ Adaptative histogram equalization:

## Linear filtering

To perform linear filtering, let introduce convolution and correlation operators between an image $I$ and a kernel $K$.

Both of them are linear shift inavariant.

### Correlation:

Correlation operator, written $O = I \oplus K$, is defined by

with (discrete case):
$$
O(i,j) = \sum_{k,l} I(i+k,j+l)K(k,l)
$$

### Convolution:

Convolution operator, written $O = I*K$, is defined by

with (discrete case):
$$
O(i,j) = \sum_{k,l} I(k,l) K(i-k, j-l) = \sum_{k,l} I(i-k,j-l)K(k,l)
$$

### Padding

To apply them on finite images, one need to introduce padding

+ zero
+ constant
+ clamp
+ wrap
+ mirror
+ extended

### Separable filtering

A convolution kernel $K$ is separable in a horizontal kernel $h$ and a vertical kernel $v$ (reduce the number of operation from $k^2$ per pixel to $2k$ per pixel):

$$
K = vh^T
$$

To see if a kernel is separable, compute SVD and see if all the singular values but one are non 0.

## Summed area table (integral image)

## Non-linear filtering

+ Median filtering
+ $\alpha$-trimmed mean
+ weighted median
+ Bilateral filtering

## Morphology
