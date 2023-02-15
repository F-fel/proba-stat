## Espace echantillon : 
+ $S = \Omega$

>ex: Lancer une piece:
$\Omega = \{Pile, Face\}$

## Evenenement :
+ tout sous ensemble d'un espace echantillon est un evenement

> ex : 
$\Omega = \mathbb{N}^+  \\
A = \{ 5,6,7\}$ 

## Relations des ensembles

>$A\subseteq B \rightleftarrows$ A sous ensemble de B-  
$\emptyset \leftrightarrow$ Ensemble vide , evenement impossible  
$\overline{A}$ ensemble complementaire de A  
$A \cup B$ A union B  
$B \cap B$ A intersection B   
$A \cap B == \emptyset \leftrightarrow$ A et B sont disjoint (ou incompatbile ou exclusif)



## Definition 1 : 

> $P(\bigcup_i{A_i}) =\Sigma P(A_i)\begin{cases}
    P(S) = 1 \\
    0\leq P(A) \leq 1 \forall A \in S \\
    A_i \cap A_j = \emptyset \;\;\;\;\ \forall i\ne j 
\end{cases}$

## Definition 2 :

> $P(A) = \Sigma P({o_i})$

## Definition 3:

> Element equiprobable :  
> P(A) = $\Sigma \frac{A.length}{N}$

## Theroremes :
>+ $P(S)=1, P(\overline{A}) = 1 - P(A),P(\emptyset)=0$  
>+ $P(A\cup B) = P(A)+P(B)-P(A\cap B)$  
>+ $P(A\cap \overline{B}) = P(A)-P(A\cap B)$  
>+ si $A \subseteq B \leftrightarrow P(a) \leq P(B)$ 
>+ $P(A\cup B \cup C) = P(A) + P(B) + P(C) - P(A\cap B)+P(A \cap C) +P(\cap C) -(P(A\cap B\cap C)$

## Ensemble et Permutation

> Skipped cause im lazy, sue me

## Probabilite conditionelle
> $P(A\mid B)=\frac{P(A\cap B)}{P(B)}$  
> $P(A \cap B) = P(B) \times P(A\mid B)$  
> $P(A \cap B) = P(A) \times P(B \mid A)$

## Evenement independants :
>* A et B independant $\leftrightarrow P(A\cap B) =P(A)*P(B)$  
> ou $P(A\mid B) = P(A) \;\text{et}\; P(B\mid A)=P(B)$
>
>+ Si A et B independant alors : $\overline{A}$ et B le sont...

## Partition
> Si : $\begin{cases}
    B_i \cap Bj=\emptyset \text{ pour i}\neq j \\
    B_1 \cup B_2 \cup ... \cup B_n = S
\end{cases}$
alors $B_1,B_2,...,B_n$ est une partitions de S

## Axiome des probabilites totales :
> Si $B_1,B_2,...,B_n$ forment une partition de S, alors pour tout __evenement__ A de S:
> P(A) = $\Sigma_{i=1}^n{P(B_i)\times P(A\mid B_i)}$

## Theoreme de Bayes
> $P(B_k\mid A) = \frac{P(B_k)\times P(A\mid B_k)}{\Sigma^n_{i=1} P(B_i)\times P(A\mid B_i)}, k=1,2,...,n.$