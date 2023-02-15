# Vecteurs aleatoires discrets
## Intro 
> Vecteur aleatoire est un vecteur de v.a. sur un meme espace echantillon S.
> __Dans le cadre du cours on se limite a un vecteur de 2 variables__

## Definitions :
### fonctions de masse conjointe :
> $p(x,y) = P(X=x,Y=y) \mid (x,y) \in R_{X\times Y}$  
> doit verifier : 
>   - $p(x,y) \geq 0 \forall (x,y) \in R_{X\times Y}$
>   - $\sum_{x\in R_X} \sum_{y\in R_Y}p(x,y)=1$
> $P([X,Y]\in A) = \sum \sum_{(x,y)\in A} p(x,y) \;\mid\; A\subseteq \mathbb{R}^2$  

Normalement presente dans un tableau :  
| y^x | 0    | 1    | 2    |
|-----|------|------|------|
| 1   | 0.24 | 0.18 | 0.12 |
| 2   | 0.16 | 0.22 | 0.08 |
---
### Distribution marginales: 
> etudes de chaque v.a. separement.  
> s'obtien de la distribution conjoint (non reciproque)  
> $p_X(x) = \sum_{y\in E_Y} p(x,y)\mid x\in R_x$  
> $p_Y(x) = \sum_{x\in R_x} p(x,y)\mid y\in R_y$  

exemple: 
| y^x | 0    | 1    | 2    | P_y  |
|-----|------|------|------|------|
| 1   | 0.24 | 0.18 | 0.12 | 0.54 |
| 2   | 0.16 | 0.22 | 0.08 | 0.46 |
| p_x | 0.4  | 0.4  | 0.2  | 1    |
---
### Distributions conditionelles :
> etude d'une variable quand l'autre est fixee.  
> $p_{Y\mid X=x}(y) = \frac{p(x,y)}{p_x(x)} \;\;\; y\in R_y$  
> $p_{Y\mid X=x}(y) = \frac{p(x,y)}{p_y(y)} \;\;\; x\in R_x$  
---
### Esperance Conditionelles : 
> $E(X\mid Y=y) = \sum_{X\in R_X} x\times p_{X|Y=y}(x)$  
> $E(Y\mid X=x) = \sum_{y\in R_Y} y\times p_{Y|X=x}(y)$  

remarque :
> $E(E(Y\mid X)) = E(Y)$  

---
### courbe de regression : 
> $g(x) = E(Y|X=x) \rightarrow$ courbe de regression Y en fonction de X

---
### Independance :
> X et Y independant $\leftrightarrow p(x,y) = p_X(x) \times p_Y(y)$  
> Si X et Y independant on peut trouver distribution conjoite a partir des marginales!

---
### Covariance :
> $Cov(X,Y) = E[(X-E(X)) \times (Y-E(Y))]$  
> $Cov(X,Y) = E(XY)-E(X)E(Y)$  
> $Cov(X,X) = V(X)$
---
### Correlation:
> coefficient de correlation $\rho$:  
> $\rho = \frac{Cov(X,Y)}{\sqrt{V(X)V(Y)}} = \frac{E(XY)-E(X)E(Y)}{\sigma_x\sigma_y}$
> + $-1 \leq \rho \leq 1$
> + $X et Y independant \leftrightarrow \rho = 0$ , (NON-reciproque)  
> + Y = aX + b $\leftrightarrow \begin{cases}
    \rho = 1 \;\; \text{si a<0} \\
    \rho = 1 \;\; \text{si a >0}
\end{cases}$  
---
## Theoreme :
> Si H(X,Y) fonction reel des deux v.a   
> E[H(X,Y)] = $\sum_x \sum_y H(x,y)p(x,y)$

## Theoreme 2 : 
> soit $X_1,X_2,...X_n$ des v.a et $a_0,a_1,...,a_n$ des constant  
> Y =$a_0 + a_1X_1 + a_2X_2 +...+X_nA_n$  
> E(Y) = $a_0 + \sum a_iE(X_i)$  
> $V(Y) = \sum a_i^2 V(X_i) + \sum\sum_{i\neq j} a_ia_jCov(X_i,X_j)$  
> Si elle sont non correle $Cov(X_i,X_j) =0, \forall i\neq j$ et $V(Y)=\sum a_i^2 V(X_i)$