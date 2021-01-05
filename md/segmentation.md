---
title: Image segmentation
author: Louis Lesueur
---

## Active contours

### Snakes

For snakes, start with an initial contour $f(s)$ and minimize the energy:

$$
E = \int (E_{int} + E_{edge} + E_{const})
$$

With:

+ $E_{int} = \alpha(s) || \partial_s f (s) ||^2 + \beta(s) || \partial_s^2 f ||^2 ds$ ($\alpha$ is the "elasticity" and $\beta$ the "rigidity")
+ $E_{edge} = - || \nabla I(f(s)) ||^2$
+ $E_{const}$ are constraints, such as spring towards an anchor point $(x,y)$ ($k_{xy}||f(s) - d(x,y)||$) and volcano ($1/r$)

Discretization leads to a linear system that can be easily solved with conjugate gradient or Jacobi iterations.

Variants:

+ B-spline snakes
+ Dynamic Snakes

### Level sets

[see here](https://wiseodd.github.io/techblog/2016/11/20/levelset-segmentation/)

## Graph based methods

### Normalized cuts

### Graph cut and energy minimization

## Clustering methods

### k-Means clustering

### watershed algorithm

### quick shift

### SLIC

### Mean shift

## Probabilistic image segmentation technique

### GMM
