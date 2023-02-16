# Loi discrete

## Loi de Bernouilli
> epreuve dont le resultat est "succes" ou "echec" (boolean)  
> p : probabilite de succes $\rightarrow$X ~ Bernouilli(p)  
> + E(X) =p ; V(X)= p(1-p)  
> + Fonction de masse : Valeurs possible {0,1}  

|x     | 0   | 1   |
|------|-----|-----|
|P(X=x)|1-p  |p    |
---

## Loi Binomial
> $n$
> repetition independantes d'une epreuve de bernouille ("Succes" = p)  
> X : nbr de succes, suit une loi binomial de parametre n et p. X~B(n,p)
>
> + Fonction de masse :  
> $R_x = \{0,1,2,...,n\}  
> P(X = x) = $\begin{cases}
    {n \choose x} p^x (1-p)^{n-x}& si\; x=0,1,2,...,n \\
    0&sinon
\end{cases}$  
> + E(X) = np, V(X) = np(1-p)  
> + Fonction de repartion :  
> F(x) = $P(X\leq x)=\sum^{x}_{k=0} {n \choose k}p^k(1-p)^{n-k}$  

---
## Loi Geometrique
> X : nbr de repetition d'epreuve de Bernouilli avant l'obtention du premier success  
> X~G(p)  
> + Fonction de masse:  
> $R_X = \{1,2,3,...\}$  
> P(X=x) = $\begin{cases}
    &p(1-p)^{x} \;\;\;&si\;x=1,2...\\
    &0 &sinon
\end{cases}$  
> __Remarque__ G(p) : non vieillisement P(X>t+s | X>t) = P(X>s)  
> + E(X) = $\frac{1}{p}$ et $V(X) = \frac{1-p}{p^2}$  
> + Fonction de repartition:  
> $F(X) = \begin{cases}
    1-(1-p)^n \;\; &si\; n\leq x < n+1, n=0,1,2,...\\
    0&sinon
\end{cases}$  

---
## Loi HyperGeometrique
> on extrait n objets d'un ensemble de N objet dont D defectueux(ou possedant une caracteristique)  
> X : nbr d'objet defectueux de n.  
> X ~ H(n,N,D)  
> + Fonction de masse  
> $R_X=\{max(0,n-N+D),...,min(n,D)\}$  
> $P(X=x)=\begin{cases}
    \frac{{D \choose x} {N-D \choose n-x}}{N \choose n} \;\; &si x\in R_X \\
    0&sinon
\end{cases}$  
>  
> + E(X) = $n \frac{D}{N}$ et V(X) = $n\frac{D}{N} \left( 1-\frac{D}{N}\right)\frac{N-n}{N-1}$  

---
## Loi de Poisson (not a fish, that's a guy name)
> X: nbr de fois qu'un evenement se realise dans une unite de mesure(temps, espace, distane...)
> S~Poi(c) si :  
> $\forall c > 0$  
> P(X=x) = $\begin{cases}
    \frac{e^{-c} c^x}{x!}\;\; &six=1,2,... \\
    0&sinon
\end{cases}$  
> + E(X) = c et V(X) = c
> + Fonction de repartition :  donnee en annexe
---
---
## Approximation : 
### Hypergeometrique $\rightarrow$ Binomial : 
> + Conditions :  
> N est grand, n $\llless$ N  
> + X~H(n,N,D) $\approx$ X~B(n,$\frac{D}{N}$) (p= $\frac{D}{N}$)

---
### Binomial $\rightarrow$ Poisson 
> + Condition :  
> n tres grand , p petit
> + X\~B(n,p) $\approx$ X\~Poi(c=np)