## Introduction
> variable aleatoire : une variable varaible representant les resultat d'un evenement aleatoire
> > example: Le nombre X d'article non conforme dans un lot de 500 ($S = \{ 0,1,2,...,500\}$)
## Definitions : 
---
### variable aleatoire:
> Une variable aleatoire est une fonction d'un espace d'echantillon ou $x=X(S)$  
> $P_x(B)=P(X\in B)$
> > example: lancer 3 fois une piece:
> > $S = \{fff,ffp,fpf,pff,fpp,pfp,ppf,ppp\}$  
> > $B=\{0,1\}$  
> > $P_x(B) = P(\{ppp,pfp,ppf,fpp\}) = \frac{4}{8} = \frac{1}{2}$
---
### Discrete vs continue :
> soit $R_X$ tel que $X \in R_X$  
> discrete = $R_X$ denombrable;  
> continue = $R_X$ non denombrable
---
### fonction de masse :
> Application seulement sur les variable __discrete__
> une fonction de masse $p(x_i) = P(X=x_i)$  doit verifier
> + $p(x) \geq 0 \forall x \in \mathbb{R}$ , $p(x) > 0 \forall x \in \mathbb{R}_X$
> + $\sum_{x\in \mathbb{R}_X} p(x_i)=1$
> + Soit $B\subseteq R_X$<br>$P(X\in B) = \sum_{x_i\in B} p(x_i)$
---
### fonction de densite
> Application seulement sur les variable __continue__  
> + $f(x) \geq 0 $
> + $\int_{-\inf}^{\inf}f(s)dx=1$  
> $P(X\in B) =\int_{x\in B} f(x)dx$

> v.a continue $\leftrightarrow$ aucune valeur porte de masse :<br>
> $P(X=d)=0,\forall d\in \mathbb{R}$
---
### Fonction de repartition :
> $F(x)=P(X\leq x)\mid \forall x \in \mathbb{R}$  
> $P(a<X\leq B) = F(b)-F(a)$.  

Doit verifier les proprietes suivantes:
> + $0\leq F(x)\leq 1 \mid \forall x \in \mathbb{R}$
> + si $x_1<x_2$ alors $F(x_1)\leq F(x_2)$ (non decroissante)
> + $\lim_{x\to\infty} F(x) =1$ et $\lim_{x\to -\infty} F(x) =0$
>
---
## Cas Discret:
> $F(x)=P(X\leq x)=\sum_{x_i\leq x} p(x_i)$  
> $p(x_0) = F(x_0)$
> $p(x_i) = F(x_i) - F(x_i-1) \mid \forall x_i>x_1$
---
## Cas Continu
> $F(x) = P(X\leq x)=\int_{-\infty}^x f(t)dt$  
> $f(x) = \frac{d}{dt}F(x)$  
---
## Esperance Mathematique (moyenne)
> Si X est discrete : $\mu = \sum_{x_i\in \mathbb{R_x}}x_ip(_xi)$  
> Si X est continu  : $\mu = \int_{-\infty}^{\infty} xf(x)dx$  
> Represente le centre de gravite de la distribution, aussi appele E(X)
---
## Variance et ecart type :
> Si X discrete:
> + $\sigma^2 = \sum_{x_i\in \mathbb{R_X}}(x_i - \mu)^2p(x_i)$  
> + $\sigma^2 = \sum_{x_i\in \mathbb{R_X}}x_i^2p(x_i) - \mu^2$  
> Si X continu :
> + $\sigma^2 = \int_{-\infty}^\infty (x-\mu)^2f(x)dx$  
> + $\sigma^2 = \int_{-\infty}^\infty x^2f(x) - \mu^2dx$  
> $\sigma^2$ mesure la dispersion, (vairabilite)  
> $\sigma = \sqrt{\sigma^2}$ est l'ecart type.
---
## Moment d'ordre k
> + moment d'ordre par rapport a l'origine ($\mu_k'$):  
> X discrete : $\mu_k' = \sum x_i^kp(x_i)$  
> X Continu  : $\mu_k' =\int_{-\infty}^\infty x^kf(x)dx$ 
> + Moment d'ordre par rapport a la moyenne ($\mu_k$):  
> X discrete : $\mu_k = \sum (x_i-\mu)^kp(x_i)$  
> X continu  : $\mu_k = \int_{-\infty}^\infty (x-\mu)^kf(x)dx$

> $\mu_0' = \mu_0 = 1$  
> $\mu_1' = \mu , \mu_1 = 0$  
> $\mu_2 = \sigma^2 = \mu_2' - \mu^2$
> $u_k = \sum_{j=0}^k (-1)^j{k \choose j}\mu^j\mu_{k-j}'$
---
## Symetrie

> X est symetrique $\leftrightarrow$ $P(X>\mu+a) = P(X<\mu-a)\mid \forall a \in \mathbb{R}$  
> Si X symmetrique alors $\mu_3 =0$
---
---
## Fonctions sur les variables aleatoire
Soit Y = H(X): 
---
fonction discretes
---
> $\forall C \subseteq R_y \exists B=\{ x\in R_X : H(x) \in C\}$  
> $P(Y\in C) = P(X\in B)$

> + X et Y Discretes:  
> $P(Y=y) = \sum_{x\in R_X; H(x)=y} P(X=x)$ 
> + X Continu, Y Discrete:    
> $P(Y=y) = \int_B f(x)dx$
---
fonction continue
---
> + Methode 1 :  
>   1. determiner fonction de repartition : $F_Y(y) = P(H(X)\leq y)$  
>   2. obtenir la densite : $f_Y(y) = \frac{d}{dy} F_y(y)
> + Methode 2 :
>   Condition H(X) croissant ou decroissant sur R_x  
>   - $f_y(y) = f_X(x) \left| \frac{dx}{dy}\right|$  where $x=H^{-1}(y)$

## esperance Y:
> X Discrete : $E(Y) = \sum_{x_i\in R_X} H(x_i)p(x_i)$  
> X Continue : $E(Y)=\int_{-\infty}^\infty H(x)f(x)dx$

Valeur particulieres:  
- $Y=X, E(Y) = E(X) = \mu$
- $Y=X^K , E(Y) = \mu_K'$
- $Y=(X - \mu)^K, e(y) = \mu_k$
- $Y=a+bX, E(Y) = a+bE(X)$

## Variance Y:
> $V(Y) = E(Y-E(Y)^2)$  
> Si Y=a+bX, V=b^2V(X)