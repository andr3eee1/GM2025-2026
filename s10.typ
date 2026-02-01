#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari supliment gazeta matematica 10",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 25289
// ============================================================================
#problem(25289, author: "Doina și Mircea Mario Stoica")[
  Rezolvați ecuația $x + floor(x) = 13 dot {x}$, unde $floor(x)$ și ${x}$ reprezintă partea întreagă, respectiv fracționară a lui $x$.
]

#proof[
  Știm că $x = floor(x) + {x}$, cu $0 <= {x} < 1$. Înlocuim în ecuație:
  $ (floor(x) + {x}) + floor(x) = 13{x} &<=> 2floor(x) = 12{x} \
                                      &<=> {x} = floor(x) / 6 $

  Aplicăm condiția de existență pentru partea fracționară:
  $ 0 <= floor(x) / 6 < 1 <=> 0 <= floor(x) < 6 $

  Deoarece $floor(x) in ZZ$, avem cazurile $k in {0, 1, ..., 5}$. Calculăm $x$ folosind relația dedusă $x = k + k/6 = (7k)/6$:
  1. $k=0 => x=0$
  2. $k=1 => x=7/6$
  3. $k=2 => x=14/6=7/3$
  4. $k=3 => x=21/6=7/2$
  5. $k=4 => x=28/6=14/3$
  6. $k=5 => x=35/6$

  *Soluție:* $S = {0, 7/6, 7/3, 7/2, 14/3, 35/6}$.
]

// ============================================================================
// PROBLEMA 25290
// ============================================================================
#problem(25290, author: "* * *")[
  Determinați $x in RR$ pentru care $floor(x) > floor(x-1/n)$, pentru orice $n>=2$.
]

#proof[
  Fie $k = floor(x)$. Relația devine $k > floor(x - 1/n)$.
  Deoarece ambii termeni sunt întregi, inegalitatea strictă implică:
  $ floor(x - 1/n) <= k - 1 $

  Aplicăm inegalitatea părții întregi $y - 1 < floor(y)$:
  $ (x - 1/n) - 1 < floor(x - 1/n) <= k - 1 $
  $ x - 1/n - 1 < k - 1 <=> x - k < 1/n $

  Știind că $x - k = {x}$, obținem:
  $ 0 <= {x} < 1/n, quad forall n >= 2 $

  Singurul număr real nenegativ mai mic decât orice fracție $1/n$ este $0$.
  $ {x} = 0 => x = k in ZZ $
]

// ============================================================================
// PROBLEMA 25291
// ============================================================================
#problem(25291, author: "* * *")[
  Fie patrulaterul convex $A B C D$ și $M in [A B], N in [C D]$ astfel încât $M A dot N C = M B dot N D$. Arătați că mijloacele segmentelor $B C, M N$ și $A D$ sunt coliniare.
]

#proof[
  
  Fie $k$ raportul comun: $frac(M A, M B) = frac(N D, N C) = k$.
  Scriem vectorii de poziție pentru $M$ și $N$:
  $ arrow(r)_M = (arrow(r)_A + k arrow(r)_B)/(1+k), quad arrow(r)_N = (arrow(r)_D + k arrow(r)_C)/(1+k) $

  Fie $P, Q, R$ mijloacele segmentelor $A D, M N$, respectiv $B C$:
  $ arrow(r)_P = (arrow(r)_A + arrow(r)_D)/2, quad arrow(r)_R = (arrow(r)_B + arrow(r)_C)/2, quad arrow(r)_Q = (arrow(r)_M + arrow(r)_N)/2 $

  Calculăm $arrow(r)_Q$ în funcție de $P$ și $R$:
  $ 2 arrow(r)_Q &= arrow(r)_M + arrow(r)_N \
    &= 1/(1+k) [ (arrow(r)_A + arrow(r)_D) + k(arrow(r)_B + arrow(r)_C) ] \
    &= 1/(1+k) [ 2 arrow(r)_P + 2k arrow(r)_R ] $

  $ arrow(r)_Q = (arrow(r)_P + k arrow(r)_R)/(1+k) $

  Aceasta este exact formula punctului care împarte segmentul $[P R]$ în raportul $k$.
  $=>$ $P, Q, R$ sunt coliniare.
]

// ============================================================================
// PROBLEMA 25292
// ============================================================================
#problem(25292, author: "* * *")[
  Fie $A B C$ un triunghi și $O$ un punct din plan. Arătați că $P in "Int"(A B C) <=> exists a,b,c in (0,1), a+b+c=1$ a.î. $arrow(O P) = a arrow(O A) + b arrow(O B) + c arrow(O C)$.
]

#proof[
  Aceasta este proprietatea coordonatelor baricentrice.
  $(=>)$ Dacă $P$ este interior, notăm ariile $S_A = "aria"(P B C)$, $S_B = "aria"(P C A)$, $S_C = "aria"(P A B)$ și $S$ aria totală.
  Fie $a=S_A/S, b=S_B/S, c=S_C/S$.
  Deoarece $P$ e interior, ariile sunt strict pozitive și mai mici ca $S$, deci $a,b,c in (0,1)$. Suma lor este $1$.
  Identitatea vectorială (Teorema lui Gergonne) confirmă relația.

  $(<=)$ Dacă relația există cu $a,b,c > 0$, punctul $P$ este centrul de greutate al maselor $a,b,c$ plasate în vârfuri. Centrul de greutate al unor mase pozitive se află strict în interiorul anvelopei convexe (triunghiul $A B C$).
]

// ============================================================================
// PROBLEMA 25293
// ============================================================================
#problem(25293)[
  a) Arătați că $floor(x) + floor(x + 1/2) = floor(2x)$, pentru orice $x in RR$.\
  b) Rezolvați ecuația $floor(x) + floor(x + 3/8) = floor(2x), x in RR$.
]

#proof[
  *a)* Fie $x = k + alpha, k in ZZ, 0 <= alpha < 1$.
  $ floor(2x) = 2k + floor(2alpha) = cases(2k &"dacă" 0 <= alpha < 1/2, 2k+1 &"dacă" 1/2 <= alpha < 1) $
  Calculăm membrul stâng (LHS):
  - Dacă $alpha < 1/2$: $floor(x) + floor(x+1/2) = k + k = 2k$. (Egalitate)
  - Dacă $alpha >= 1/2$: $floor(x) + floor(x+1/2) = k + (k+1) = 2k+1$. (Egalitate)

  *b)* Folosind a), ecuația devine $floor(x) + floor(x + 3/8) = floor(x) + floor(x + 1/2)$.
  $ floor(x + 3/8) = floor(x + 1/2) $
  Fie $x = k + alpha$. Relația se reduce la $floor(alpha + 3/8) = floor(alpha + 1/2)$.
  Diferența argumentelor este $1/8$. Egalitatea eșuează doar dacă între ele se află un număr întreg.
  Singurul întreg posibil este $1$.
  Condiția de "salt" peste 1: $alpha + 3/8 < 1 <= alpha + 1/2$.
  $ alpha < 5/8 " și " alpha >= 1/2 => alpha in [1/2, 5/8) $
  Pentru a avea *egalitate*, $alpha$ trebuie să fie în afara acestui interval:
  $ alpha in [0, 1/2) union [5/8, 1) $
  $ x in union_(k in ZZ) ([k, k+0.5) union [k+0.625, k+1)) $
]

// ============================================================================
// PROBLEMA 25294
// ============================================================================
#problem(25294)[
  Fie $x, y, z in RR^*$ astfel încât $x y, y z, z x$ sunt numere raționale.\
  a) Arătați că numărul $x^2 + y^2 + z^2$ este rațional.\
  b) Dacă, în plus, $x^3 + y^3 + z^3$ este număr rațional, atunci $x, y, z in QQ$.
]

#proof[
  *a)* $x^2 = (x y dot x z) / (y z)$. Cum $x y, x z, y z in QQ^*$, rezultă $x^2 in QQ$.
  Analog $y^2, z^2 in QQ => x^2+y^2+z^2 in QQ$.

  *b)* Avem $x^2 in QQ => x = q_1 sqrt(d)$, unde $q_1 in QQ, d in NN$ (liber de pătrate).
  Din $x y in QQ => y = q_2 sqrt(d)$. Analog $z = q_3 sqrt(d)$.
  Expresia cubică devine:
  $ x^3 + y^3 + z^3 = (q_1^3 + q_2^3 + q_3^3) d sqrt(d) $
  Pentru ca aceasta să fie rațională, avem două cazuri:
  1. $sqrt(d) in QQ => x, y, z in QQ$.
  2. $q_1^3 + q_2^3 + q_3^3 = 0$.
     Știm că $a^3+b^3+c^3=0$ nu are soluții raționale nenule. Cum $x,y,z != 0$, coeficienții $q_i$ sunt nenuli, deci suma nu e 0.
  Rămâne doar cazul 1, deci $x, y, z in QQ$.
]

// ============================================================================
// PROBLEMA 25295
// ============================================================================
#problem(25295)[
  Fie triunghiul $A B C$ și punctele $M in (A B)$, $N in (A C)$, $P in B C$ astfel încât $arrow(B C) = 2 arrow(C P)$, $(M A) / (M B) = 1/2$ și $(N C) / (A C) = 2/5$.\
  a) Exprimați vectorii $arrow(A M), arrow(A N)$ și $arrow(A P)$ în funcție de vectorii $arrow(A B)$ și $arrow(A C)$.\
  b) Exprimați $arrow(M N)$ și $arrow(M P)$ în funcție de vectorii $arrow(A B)$ și $arrow(A C)$.\
  c) Arătați că $M, N, P$ coliniare și determinați raportul $(M N) / (M P)$.
]

#proof[
  *a) Exprimarea vectorilor:*
  1. $(M A) / (M B) = 1/2 => arrow(A M) = 1/3 arrow(A B)$.
  2. $(N C) / (A C) = 2/5 => A N = 3/5 A C => arrow(A N) = 3/5 arrow(A C)$.
  3. $arrow(B C) = 2 arrow(C P)$\
     Deci $arrow(r)_C - arrow(r)_B = 2(arrow(r)_P - arrow(r)_C) => 3 arrow(r)_C - arrow(r)_B = 2 arrow(r)_P$
     $arrow(r)_P = 3/2 arrow(r)_C - 1/2 arrow(r)_B$.\
     Deci $arrow(A P) = 3/2 arrow(A C) - 1/2 arrow(A B)$.

  *b) Vectorii de legătură:*
  $ arrow(M N) &= arrow(A N) - arrow(A M) = 3/5 arrow(A C) - 1/3 arrow(A B) \
    arrow(M P) &= arrow(A P) - arrow(A M) = (3/2 arrow(A C) - 1/2 arrow(A B)) - 1/3 arrow(A B) \
               &= 3/2 arrow(A C) - 5/6 arrow(A B) $

  *c) Coliniaritate:*
  Observăm raportul coeficienților:
  $ (3/2) / (3/5) = 5/2, quad (-5/6) / (-1/3) = 15/6 = 5/2 $
  $ => arrow(M P) = 5/2 arrow(M N) $
  Vectorii sunt coliniari, deci punctele sunt coliniare. Raportul este $(M N) / (M P) = 2/5$.
]

// ============================================================================
// PROBLEMA 25296
// ============================================================================
#problem(25296)[
  Considerăm paralelogramul $A B C D$ și punctele $M in A B, N in A C$ astfel încât $arrow(A M) = 1/4 arrow(A B), arrow(A N) = 1/5 arrow(A C)$. Exprimați vectorii $arrow(D N), arrow(M N)$ în funcție de vectorii $arrow(A B)$ și $arrow(A D)$, iar apoi arătați că $D, N, M$ sunt coliniare.
]

#proof[
  Scriem totul în funcție de baza $arrow(A B), arrow(A D)$.
  $ arrow(A N) = 1/5 (arrow(A B) + arrow(A D)) $
  $ arrow(D N) &= arrow(A N) - arrow(A D) = 1/5 arrow(A B) - 4/5 arrow(A D) \
    arrow(M N) &= arrow(A N) - arrow(A M) = (1/5 arrow(A B) + 1/5 arrow(A D)) - 1/4 arrow(A B) \
               &= -1/20 arrow(A B) + 1/5 arrow(A D) $

  Verificăm proporționalitatea:
  $ arrow(D N) = -4 (-1/20 arrow(A B) + 1/5 arrow(A D)) = -4 arrow(M N) $
  Rezultă $D, N, M$ coliniare.
]

// ============================================================================
// PROBLEMA 25297
// ============================================================================
#problem(25297, author: "Olimpiada Rusia")[
  Fie $(a_n)_(n>=1)$ un șir de numere naturale pentru care cel mai mare divizor comun al numerelor $m$ și $n$ divide $a_n + a_m$, pentru orice numere distincte $m, n in NN^*$. Arătați că $2025$ divide $a_2025$.
]

#proof[
  Ipoteza: $n | a_n + a_(2n)$ (luând $m=2n$) $=>$ $a_(2n) equiv -a_n (mod n)$.\
  Ipoteza: $n | a_n + a_(3n)$ (luând $m=3n$) $=>$ $a_(3n) equiv -a_n (mod n)$.\
  Ipoteza pentru $(2n, 3n)$: $gcd(2n, 3n) = n | a_(2n) + a_(3n)$.

  Înlocuim congruențele:
  $ a_(2n) + a_(3n) equiv -a_n - a_n = -2a_n equiv 0 (mod n) $
  Deci $n | 2a_n$.

  Pentru $n = 2025$, avem $2025 | 2a_2025$.\
  Deoarece $2025$ este impar, $gcd(2025, 2) = 1$ => $2025 | a_2025$.\
]

// ============================================================================
// PROBLEMA 25298
// ============================================================================
#problem(25298, author: "* * *")[
  Fie $A B C D$ un patrulater convex astfel încât diagonalele sale, care se intersectează în $E$, sunt perpendiculare. Arătați că simetricele lui $E$ față de laturile patrulaterului sunt puncte conciclice.
]

#proof[
  
  Fie $P_1, P_2, P_3, P_4$ proiecțiile lui $E$ pe laturile $A B, B C, C D, D A$.
  Simetricele $S_i$ se obțin prin omotetie de centru $E$ și raport 2 a punctelor $P_i$. Este suficient să arătăm că $P_i$ sunt conciclice.

  Patrulaterul $A B C D$ având diagonale perpendiculare, $E P_1 perp A B$.
  Patrulaterul $P_1 E P_2 B$ este inscriptibil ($hat(E P_1 B) = hat(E P_2 B) = 90 degree$).
  $ => hat(P_1 P_2 E) = hat(P_1 B E) = 90 degree - hat(A) $
  Similar din $P_3 E P_2 C$: $hat(P_3 P_2 E) = 90 degree - hat(D)$.

  Unghiul $hat(P_1 P_2 P_3) = 180 degree - (hat(A) + hat(D))$.
  Analog $hat(P_1 P_4 P_3) = 180 degree - (hat(B) + hat(C))$.
  Într-un patrulater ortodiagonal, proiecțiile intersecției diagonalelor sunt conciclice (cercul celor 8 puncte).
  Rezultă că și simetricele $S_i$ sunt conciclice.
]

// ============================================================================
// PROBLEMA 25299
// ============================================================================
#problem(25299, author: "Olimpiadă Turcia")[
  Fie $x, y, z > 0$ cu $x y z = 1$. Arătați că
  $ (x^4 + y)(y^4 + z)(z^4 + x) >= (x + y^2)(y + z^2)(z + x^2). $
]

#proof[
  Vom folosi inegalitatea *Cauchy-Schwarz* aplicată unor perechi de termeni aleși strategic.

  Observăm că putem aplica C-S pentru un factor din membrul stâng, $(x^4 + y)$, și un factor "decalat" din membrul drept, $(y + z^2)$:
  $
    (x^4 + y)(z^2 + y) &>= (x^2 dot z + sqrt(y) dot sqrt(y))^2 \
                       &= (x^2 z + y)^2
  $
  Folosind condiția $x y z = 1$, termenul $x^2 z$ se rescrie astfel:
  $ x^2 z = x dot (x z) = x dot (1/y) = x/y $
  
  Astfel, inegalitatea devine:
  $ (x^4 + y)(y + z^2) >= (x/y + y)^2 $

  Scriem inegalitățile analoage prin permutări circulare $(x -> y -> z)$:
  $
    (1) quad & (x^4 + y)(y + z^2) >= (x/y + y)^2 \
    (2) quad & (y^4 + z)(z + x^2) >= (y/z + z)^2 \
    (3) quad & (z^4 + x)(x + y^2) >= (z/x + x)^2
  $

  Înmulțind cele trei relații (1), (2) și (3), obținem:
  $
    P_(L H S) dot P_(R H S) >= [(x/y + y)(y/z + z)(z/x + x)]^2
  $
  unde $P_(L H S)$ este membrul stâng al inegalității din enunț, iar $P_(R H S)$ membrul drept.

  Analizăm termenii din partea dreaptă. Observăm identitatea:
  $ x + y^2 = y(x/y + y) $
  Aplicând acest lucru pentru toți termenii din $P_(R H S)$:
  $
    P_(R H S) &= (x + y^2)(y + z^2)(z + x^2) \
              &= [y(x/y + y)] dot [z(y/z + z)] dot [x(z/x + x)] \
              &= (x y z) dot (x/y + y)(y/z + z)(z/x + x)
  $
  Deoarece $x y z = 1$, rezultă că $P_(R H S) = (x/y + y)(y/z + z)(z/x + x)$.
  
  Revenind la inegalitatea produselor:
  $ P_(L H S) dot P_(R H S) >= P_(R H S)^2 $
  
  Simplificând prin $P_(R H S)$ (care este strict pozitiv), obținem:
  $ P_(L H S) >= P_(R H S) $
  ceea ce încheie demonstrația.
]

// ============================================================================
// PROBLEMA 25300
// ============================================================================
#problem(25300, author: "* * *")[
  Fie $(a_n)_(n>=1)$ un șir de numere reale pozitive pentru care
  $ a_n = max_(s,t < n) a_s a_t - min_(s,t < n) a_s a_t, space"pentru orice" n >= 5. $
  Pentru ce valori ale lui $a_1, a_2, a_3, a_4$ este acest șir mărginit?
]

#proof[
  Notăm $M_n = max {a_1, ..., a_n}$ și $m_n = min {a_1, ..., a_n}$.
  
  Deoarece termenii sunt pozitivi, maximele și minimele produselor se realizează prin înmulțirea maximelor, respectiv minimelor individuale:
  $
    max_(s,t < n) (a_s a_t) = M_(n-1)^2 quad "și" quad min_(s,t < n) (a_s a_t) = m_(n-1)^2
  $
  Relația de recurență devine:
  $ a_n = M_(n-1)^2 - m_(n-1)^2 $

  Condiția necesară și suficientă pentru mărginire este $M_4 <= 1$.

  *Cazul 1:* $M_4 <= 1$ (adică $a_1, a_2, a_3, a_4 in (0, 1]$).\
  Demonstrăm prin inducție că $M_n <= 1$ pentru orice $n$.
  Presupunem $M_(n-1) <= 1$. Atunci:
  $ a_n = M_(n-1)^2 - m_(n-1)^2 <= 1^2 - 0 = 1 $
  Deci $a_n <= 1$, ceea ce implică $M_n = max(M_(n-1), a_n) <= 1$.
  Șirul este mărginit superior de 1 și inferior de 0.

  *Cazul 2:* $M_4 > 1$.\
  TODO: De vazut de ce nu merge cazul asta

  *Concluzie:* Șirul este mărginit dacă și numai dacă $a_1, a_2, a_3, a_4 in (0, 1]$.
]