---
title: Feature processing
author: Louis Lesueur
---

## Feature detection

## Feature matching

## Feature alignment

### 2D alignment with least squares (usefull for panography)

Given a set of matched feature points $(x,x')$ in two images, one can infer a transformation of the form $x'=f_p(x)$ with parameters $p$ that can be found by minimizing the linear least square energy:
$$
E_{LLS} = \sum_i ||x_i'-f_p(x_i)||^2
$$

For simple transforms, we have: $\Delta x = x'-x = J(x)p$, where $J$ is the jacobian. The problem becomes equivalent to solving the system:
$$
Ab = p
$$
with:

+ $A = \sum_i J^T(x_i) J(x_i)$
+ $b = \sum_i J^T(x_i) \Delta x_i$

| Transfoorm | Jacobian |
|-|-|
|translation | $\begin{pmatrix}
1 & 0\\
0 & 1 \\
\end{pmatrix}$ |
|euclidian | $\begin{pmatrix}
1 & 0 & -s_\theta x - c_\theta y\\
0 & 1 & c_\theta x - s_\theta y\\
\end{pmatrix}$
|similarity |$\begin{pmatrix}
1 & 0 &  x & - y\\
0 & 1 &  y & x\\
\end{pmatrix}$
|affine |$\begin{pmatrix}
1 & 0 &  x & y & 0 & 0\\
0 & 1 &  0 & 0 & x & y\\
\end{pmatrix}$

Variants such as weighted least squares and covariant weighted least squares can be used.

### Robust least square and RANSAC

When there are robust outliers:

$$
E_{RLS}(\Delta p) = \sum_i \rho(||r_i||)
$$

with $r_i=f_p(x_i)-x_i'$ the residuals, and $\rho$ a wrobust penalty.

weighted:

$$
E_{IRLS}(\Delta p) = \sum_i w(||r_i||) ||r_i||^2
$$

When there are too much outliers, RANSAC algorithm can be usefull:

1. Estimate $p$ on a subset of $k$ correspondances
2. Compute $r_i$ on the subset with the estimated $p$
3. count the number of inliers (such as $||r_i|| < \epsilon$ for a chosen $\epsilon$)
4. Repeat the selction process $S$ times, and select the one with the largest number of inliers

### 3D alignment (absolute orientation problem)

In the case of a rigid euclidian motion, the energy to minimize is:

$$
E_{R3D} = \sum_i ||x_i' - Rx_i -t ||^2
$$

Estimators for $t$ and $R$ can be computed:

+ $t = c'-Rc$ where $c$ and $c'$ are the centroids of the cloud points
+ $R=UV^T$ where  $C=U \Sigma V^T$ is the singular decomposition of the correlation matrix $C = \sum_i (x'-c')(x-c)^T$

## Pose estimation and camera calibration

General idea:

Use the fact that $\tilde{x_s} = K [R,t] p = Pp$, solve a linear system to find $P$ and use the $RQ$ factorization to find $K$ and $[R,t]$
