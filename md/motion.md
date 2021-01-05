---
title: Motion
author: Louis Lesueur
---

## Triangulation

Goal: estimate $p$ knowing $c_0$, $c_1$ and $x_0$, $x_1$ the optical centers of two cameras and the projections of $p$ on the images:

Let's note $v_i = \tilde{x_i}-c_i$ the vector going from the optical center to the image plan. The, the point on the ray directed by $v_i$ which is the closest to $p$ is:
$$
q_i = \argmin_d ||c_j + d v_j - p ||^2 v_j = c_j + (v_j v_j^T)(p-c_j) =  c_j + (p-c_j)_{||}
$$

An estimation of $p$ is then given by:

$$
p = \argmin_p \sum_j ||(p-c_j)_\perp ||^2 = (\sum_j (I-v_j v_j^T))^{-1} (\sum_j (I-v_j v_j^T)c_j)^{-1}
$$

## Two-frame structure from motion (application: view morphing)

From two images taken by two cameras with $c_0 \overset{(R,t)}{\rightarrow} c_1$, and a set of matched points $(x_{0i}, x_{1,j})$, find $(R,t)$

We have: $d_1 \tilde{x_1} = R d_0 \tilde{x_0} + t$, taking the cross-product by $t$ from the left and the dot product by $\tilde{x_1}$ on the right we have the epipolar constraint:

$$
\tilde{x_1}^T E \tilde{x_0} = 0
$$

where $E = [t]_\times R$ is the essential matrix

Note that $E$ maps a point to its corresonding epipolar line in the other image: $l_1 = E \tilde{x_0}$ and $l_0 = E^T \tilde{x_1}$

### Estimating motion parameters

$E$ can be estimated using the epipolar constraint by forming a linear system using the matched points. Then several techniques exists to extract $R$ and $t$ from $E$.

## Factorization

From $M$ cameras and $N$ matched points we have can build the

[see here](http://www.cs.unc.edu/~lazebnik/spring11/lec17_sfm.pdf)

## Dense motion estimation

[see here](https://www.ece.mcmaster.ca/~shirani/vision/Dense_Motion.pdf)
