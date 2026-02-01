#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari supliment gazeta matematica 11",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 25337
// ============================================================================
#problem(25337, author: $ast ast ast$)[
  Determinați soluțiile reale ale ecuației
  $ floor(1/(1-x)) = 1/(1-floor(x)), $
  unde $floor(a)$ reprezintă partea întreagă a numărului real $a$.
]

#proof[
  Notăm $k = floor(x)$, unde $k in ZZ$. Ecuația dată devine:
  $ floor(1/(1-x)) = 1/(1-k) $
  Deoarece membrul stâng este un număr întreg, membrul drept $1/(1-k)$ trebuie să fie, de asemenea, un număr întreg. Singurele divizoare întregi ale lui 1 sunt 1 și -1. Astfel, avem două cazuri pentru numitorul $1-k$:

  *Cazul 1:* $1 - k = 1 => k = 0$.
  Dacă $k = floor(x) = 0$, atunci $x in [0, 1)$.
  Ecuația devine $floor(1/(1-x)) = 1$. Din definiția părții întregi:
  $ 1 <= 1/(1-x) < 2 $
  Rezolvăm inegalitățile:
  1. $1/(1-x) >= 1 => (1 - (1-x))/(1-x) >= 0 => x/(1-x) >= 0$. Cum $x < 1$, numitorul e pozitiv, deci $x >= 0$.
  2. $1/(1-x) < 2$. Deoarece $x < 1$, înmulțim cu $1-x$ (pozitiv): $1 < 2(1-x) => 1 < 2 - 2x => 2x < 1 => x < 1/2$.
  Intersectând cu condiția $x in [0, 1)$, obținem $x in [0, 1/2)$.

  *Cazul 2:* $1 - k = -1 => k = 2$.
  Dacă $k = floor(x) = 2$, atunci $x in [2, 3)$.
  Ecuația devine $floor(1/(1-x)) = -1$.
  $ -1 <= 1/(1-x) < 0 $
  Partea dreaptă ($<0$) implică $1-x < 0 => x > 1$, ceea ce e adevărat pentru $x in [2, 3)$.
  Partea stângă: $1/(1-x) >= -1$. Înmulțim cu $1-x$ (negativ):
  $ 1 <= -1(1-x) => 1 <= -1 + x => x >= 2$.
  Această condiție este satisfăcută pentru tot intervalul $x in [2, 3)$.

  *Concluzie:* Soluțiile sunt $x in [0, 1/2) union [2, 3)$.
]

// ============================================================================
// PROBLEMA 25338
// ============================================================================
#problem(25338, author: $ast ast ast$)[
  Arătați că, pentru orice $x_1, x_2, ..., x_n in RR$, are loc inegalitatea
  $ floor(x_1)^2 + floor(x_2)^2 + ... + floor(x_n)^2 + 3n > 2(x_1 + x_2 + ... + x_n) $
]

#proof[
  Este suficient să demonstrăm inegalitatea pentru un singur termen arbitrar $x$, adică:
  $ floor(x)^2 + 3 > 2x $
  Scriem $x = k + alpha$, unde $k = floor(x) in ZZ$ și $alpha in [0, 1)$. Inegalitatea devine:
  $ k^2 + 3 > 2(k + alpha) $
  $ k^2 - 2k + 3 > 2alpha $
  Observăm că membrul stâng poate fi rescris ca $(k-1)^2 + 2$.
  Deoarece $(k-1)^2 >= 0$, valoarea minimă a membrului stâng este 2 (atinsă pentru $k=1$).
  Pe de altă parte, știm că $alpha < 1$, deci $2alpha < 2$.
  Astfel, avem șirul de inegalități:
  $ k^2 - 2k + 3 >= 2 > 2alpha $
  Ceea ce demonstrează că $floor(x_i)^2 + 3 > 2x_i$ pentru oricare $i$.
  Sumând aceste inegalități pentru $i = 1, ..., n$, obținem rezultatul cerut.
]

// ============================================================================
// PROBLEMA 25339
// ============================================================================
#problem(25339, author: $ast ast ast$)[
  Determinați toate numerele întregi $m$ care au propietatea că ecuația $abs(x) + abs(x-1) + abs(x-2) + abs(x-3) + abs(x-4) = m$ are soluție unică.
]

#proof[
  Fie funcția $f(x) = abs(x) + abs(x-1) + abs(x-2) + abs(x-3) + abs(x-4)$.
  Aceasta este o sumă de funcții convexe (modulul), deci $f(x)$ este o funcție convexă. Minimul unei sume de module de forma $sum abs(x - a_i)$ se atinge în mediana șirului $a_i$.
  Termenii din module se anulează în punctele $0, 1, 2, 3, 4$. Mediana acestor valori este $2$.
  Calculăm valoarea funcției în punctul de minim $x = 2$:
  $ f(2) = abs(2) + abs(2-1) + abs(2-2) + abs(2-3) + abs(2-4) $
  $ f(2) = 2 + 1 + 0 + 1 + 2 = 6 $
  
  Analizăm monotonia:
  - Pentru $x > 2$, panta funcției este pozitivă (mai mulți termeni $x$ cu plus decât cu minus).
  - Pentru $x < 2$, panta funcției este negativă.
  - În $x = 2$, funcția are un minim global strict (forma graficului este de tip "V", nu de "cădiță" plată, deoarece numărul de termeni este impar).
  
  Ecuația $f(x) = m$ reprezintă intersecția graficului cu dreapta orizontală $y = m$.
  - Dacă $m < 6$, nu avem soluții.
  - Dacă $m = 6$, avem o soluție unică ($x=2$), deoarece minimul este un singur punct.
  - Dacă $m > 6$, dreapta taie graficul în două puncte (unul pe ramura descrescătoare, unul pe cea crescătoare).
  
  *Concluzie:* Singura valoare întreagă este $m = 6$.
]

// ============================================================================
// PROBLEMA 25340
// ============================================================================
#problem(25340, author: $ast ast ast$)[
  Se consideră paralelogramul $A B C D$. O dreaptă oarecare taie dreptele $A D, B D$ și $C D$ în punctele $M, N, "respectiv" P$, astfel încât $arrow(D M) = a arrow(D A), arrow(D N) = b arrow(D B)$ și $arrow(D P) = c arrow(D C)$. Demonstrați că $2b <= sqrt(a c)$.
]

#proof[
  Avem $arrow(D M) = a arrow(D A)$ și $arrow(D P) = c arrow(D C)$.
  Folosind regula paralelogramului, $arrow(D B) = arrow(D A) + arrow(D C)$.
  Astfel, $arrow(D N) = b(arrow(D A) + arrow(D C))$.
  
  Deoarece $M, N, P$ sunt coliniare, există un scalar $t$ astfel încât $arrow(D N) = (1-t)arrow(D M) + t arrow(D P)$.
  Înlocuind vectorii:
  $ b arrow(D A) + b arrow(D C) = (1-t)a arrow(D A) + t c arrow(D C) $
  Deoarece $arrow(D A)$ și $arrow(D C)$ sunt liniar independenți, coeficienții lor trebuie să fie egali:
  1. $b = (1-t)a => 1-t = b/a => t = 1 - b/a$
  2. $b = t c => t = b/c$
  
  Egalăm expresiile pentru $t$:
  $ 1 - b/a = b/c => 1 = b(1/a + 1/c) => 1/b = 1/a + 1/c => b = (a c)/(a+c) $
  Relația de demonstrat devine:
  $ (2 a c)/(a+c) <= sqrt(a c) $
  Împărțim prin $sqrt(a c)$ (care e pozitiv):
  $ (2 sqrt(a c))/(a+c) <= 1 => 2sqrt(a c) <= a+c $
  Aceasta este exact inegalitatea mediilor ($m_g <= m_a$), adevărată pentru orice $a,c > 0$.
]

// ============================================================================
// PROBLEMA 25341
// ============================================================================
#problem(25341, author: $ast ast ast$)[
  a) Fie $x$ un număr natural nenul astfel încât $x + 1/x in NN$. Arătați că $x^n + 1/x^n in NN$ pentru orice $n in NN$.\
  b) Arătați că, pentru orice $n in NN$, numărul $(2-sqrt(3))^n + (2+sqrt(3))^n$ este natural.
]

#proof[
  a) Fie $E_n = x^n + 1/x^n$. Știm că $E_1 in NN$.\
  Calculăm $E_1 dot E_n = (x + 1/x)(x^n + 1/x^n) = x^(n+1) + 1/x^(n-1) + x^(n-1) + 1/x^(n+1) = E_(n+1) + E_(n-1)$.\
  Avem relația de recurență: $E_(n+1) = E_1 dot E_n - E_(n-1)$.\
  Verificăm baza inducției:
  - $E_0 = 1 + 1 = 2 in NN$.
  - $E_1 in NN$ (din ipoteză).
  Deoarece $E_(n+1)$ se obține prin operații cu numere întregi din termenii anteriori, rezultă prin inducție că $E_n in ZZ$ pentru orice $n$. Pentru $x > 0$, $E_n > 0$, deci este natural.

  b) Notăm $a = 2 + sqrt(3)$. Observăm că $1/a = 1/(2+sqrt(3)) = 2-sqrt(3)$.\
  Problema cere să arătăm că $a^n + 1/a^n in NN$.\
  Verificăm condiția de la punctul a):\
  $ a + 1/a = (2+sqrt(3)) + (2-sqrt(3)) = 4 in NN. $
  Conform punctului a), suma puterilor este număr natural.
]

// ============================================================================
// PROBLEMA 25342
// ============================================================================
#problem(25342, author: $ast ast ast$)[
  Fie mulțimea $A = {1, 2, 3, ..., 2025}$.\
  a) Câți multiplii de $17$ conține mulțimea $A$ ?\
  b) Câte numere din $A$ sunt divizibile simultan cu $4, "cu" 14 "și cu" 10$ ?\
  c) Câte numere din $A$ sunt divizibile simultan cu $2, "cu" 3 "și cu" 5$ ?\
  d) Câte numere din $A$ nu sunt divizibile nici cu $2, "nici cu" 3, "nici cu" 5$ ?
]

#proof[
  Notăm $N(k)$ numărul elementelor din $A$ divizibile cu $k$. Formula este $N(k) = floor(2025/k)$.

  a) $N(17) = floor(2025/17) = 119$.

  b) Un număr este divizibil cu 4, 14 și 10 dacă este divizibil cu $c m m m c(4, 14, 10)$.\
  $4=2^2, 14=2 dot 7, 10=2 dot 5$.\
  $c m m m c = 2^2 dot 5 dot 7 = 140$.\
  $N(140) = floor(2025/140) = 14$.

  c) Divizibile cu 2, 3 și 5 înseamnă divizibile cu $c m m m c(2, 3, 5) = 30$.\
  $N(30) = floor(2025/30) = 67$.

  d) Folosim Principiul Includerii și Excluderii. Fie $P$ proprietatea de a NU fi divizibil.\
  Total numere $= 2025$.\
  Scădem cei divizibili cu 2, 3 sau 5 ($|A_2 union A_3 union A_5|$).\
  $|A_2 union A_3 union A_5| = N(2) + N(3) + N(5) - (N(6) + N(10) + N(15)) + N(30)$.
  - $N(2) = 1012$
  - $N(3) = 675$
  - $N(5) = 405$
  - $N(6) = 337$
  - $N(10) = 202$
  - $N(15) = 135$
  - $N(30) = 67$
  Suma $= (1012 + 675 + 405) - (337 + 202 + 135) + 67 = 2092 - 674 + 67 = 1485$.\
  Numerele căutate sunt $2025 - 1485 = 540$.
]

// ============================================================================
// PROBLEMA 25343
// ============================================================================
#problem(25343, author: $ast ast ast$)[
  Fie $D, E, F$ mijloacele laturilor $B C, C A, A B$ ale triunghiului $A B C$.\
  a) Arătați că $arrow(A E) + arrow(A F) = arrow(A D)$.\
  b) Dacă $arrow(A P) = arrow(A B) + arrow(A C)$, demonstrați că punctele $A, D, P$ sunt coliniare.\
  c) Arătați că $arrow(A P) = 2\(arrow(A E) + arrow(A F)\)$.
]

#proof[
  a) $E$ mijlocul lui $A C => arrow(A E) = 1/2 arrow(A C)$. $F$ mijlocul lui $A B => arrow(A F) = 1/2 arrow(A B)$.\
  Suma este $1/2(arrow(A B) + arrow(A C))$.\
  Deoarece $D$ este mijlocul lui $B C$, mediana $arrow(A D) = 1/2(arrow(A B) + arrow(A C))$.\
  Rezultă $arrow(A E) + arrow(A F) = arrow(A D)$.

  b) $arrow(A P) = 2 dot 1/2(arrow(A B) + arrow(A C)) = 2 arrow(A D)$.\
  Fiind proporționali ($arrow(A P) = 2 arrow(A D)$), vectorii sunt coliniari, deci punctele $A, D, P$ sunt coliniare.

  c) Din b) avem $arrow(A P) = 2 arrow(A D)$.\
  Din a) avem $arrow(A D) = arrow(A E) + arrow(A F)$.\
  Înlocuind $arrow(A D)$ în prima relație: $arrow(A P) = 2(arrow(A E) + arrow(A F))$.
]

// ============================================================================
// PROBLEMA 25344
// ============================================================================
#problem(25344, author: $ast ast ast$)[
  Fie $A B C D$ un trapez cu bazele $A B$ și $C D, A B = a, C D = b, A C inter B D = {O}$. Paralelea dusă prin $O$ la baze intersectează laturile neparalele $A D$ și $B C$ în $E$, respectiv $F$. Arătați că:\
  a) $arrow(E O) = a/(a+b) arrow(D C)$.\
  b) $arrow(O F) = 1/(a+b) arrow(D C)$ (Observație: Enunțul original probabil cere $a/(a+b)$ și pentru OF, din simetrie).
]

#proof[
  a) Triunghiurile $Delta A O B$ și $Delta C O D$ sunt asemenea (baze paralele).\
  Raportul de asemănare: $k = (A O)/(O C) = (A B)/(C D) = a/b$.\
  Aplicăm TFA  în $Delta A D C$ unde $E O parallel D C$:
  $ (E O)/(D C) = (A O)/(A C) = (A O)/(A O+O C) = ((A O)/(O C)) / ((A O)/(O C) + 1) = (a/b) / (a/b + 1) = a / (a+b) $
  Vectorial, $arrow(E O)$ și $arrow(D C)$ au același sens, deci:
  $ arrow(E O) = a/(a+b) arrow(D C) $

  b) (Corectură necesară enunț: coeficientul este tot $a/(a+b)$ din simetria trapezului).\
  În $Delta B D C$, $O F parallel D C$.
  $ (O F)/(D C) = (B O)/(B D) = (B O)/(B O+O D) $
  Din asemănarea inițială $(B O)/(O D) = a/b$. Rezultă identic $(O F)/(D C) = a/(a+b)$.\
  Vectorial: $arrow(O F) = a/(a+b) arrow(D C)$.\
]

// ============================================================================
// PROBLEMA 25345
// ============================================================================
#problem(25345, author: $ast ast ast$)[
  Se consideră numerele reale $a, b, c in (0, oo)$, care au proprietatea că
  $ sqrt(a/c) + sqrt(c/b) + sqrt(b/a) = a/b + b/c + c/a. $
  Demonstrați că $a = b = c$.
]

#proof[
  Facem substituția: $x = sqrt(a/b), y = sqrt(b/c), z = sqrt(c/a)$.\
  Observăm că $x y z = sqrt(a/b dot b/c dot c/a) = sqrt(1) = 1$.\
  Relația din enunț devine:
  $ sqrt(a/c) + sqrt(c/b) + sqrt(b/a) = x^2 + y^2 + z^2 $
  Dar $sqrt(a/c) = sqrt((a/b) dot (b/c)) = sqrt(x^2 y^2) = x y = 1/z$.\
  Analog $sqrt(c/b) = 1/x$ și $sqrt(b/a) = 1/y$.\
  Ecuația devine
  $ 1/x + 1/y + 1/z = x^2 + y^2 + z^2 $
  Din $x y z=1$, avem $1/x = y z$, deci $x y + y z + z x = x^2 + y^2 + z^2$.\
  Înmulțim cu 2 relația:
  $ 2x^2 + 2y^2 + 2z^2 - 2x y - 2y z - 2z x = 0 $
  $ (x-y)^2 + (y-z)^2 + (z-x)^2 = 0 $
  Suma de pătrate reale este 0 dacă și numai dacă fiecare termen este 0:
  $ x = y = z $
  Cum $x y z=1 => x^3=1 => x=1$.
  $ sqrt(a/b) = 1 => a=b $
  Analog $b=c$. Deci $a=b=c$.
]

// ============================================================================
// PROBLEMA 25346
// ============================================================================
#problem(25346, author: $ast ast ast$)[
  Se consideră numerele reale $a_1, a_2, ..., a_n$, care îndeplinesc condiițiile $a_1 dot a_2 dot ... dot a_k >= 1$, pentru orice $k in {1, 2, ..., n}$. Demonstrați că
  $ 1/(1+a_1) + 2/((1+a_1)(1+a_2)) + ... + n/((1+a_1)(1+a_2)...(1+a_n)) < 2 $
]

#proof[
  Folosim inegalitatea lui Huygens (sau generalizarea AM-GM) pentru produsul termenilor de la numitor.\
  Pentru orice $k$, avem 
  $ product_(i=1)^k (1+a_i) >= (1 + root(k, product_(i=1)^k a_i))^k $
  Din ipoteză, $product_(i=1)^k a_i >= 1$.\
  Atunci: $product_(i=1)^k (1+a_i) >= (1+1)^k = 2^k$.
  
  Termenul general al sumei devine:
  $ T_k = k/((1+a_1)...(1+a_k)) <= k/2^k $
  Suma dată $S$ verifică 
  $ S <= sum_(k=1)^n k/2^k = 2 - (n+2)/2^n < 2 $
  Deci suma inițială este strict mai mică decât 2.
]

// ============================================================================
// PROBLEMA 25347
// ============================================================================
#problem(25347, author: $ast ast ast$)[
  Se consideră patrulaterul $A B C D$ înscris într-un cerc de centru $O$. Se notează cu $H_1, H_2, H_3, H_4$ ortocentrele triunghiurilor $A B C, B C D, C D A, "respectiv" D A B$ și cu $M, N$ mijloacele diagonalelor $A C$, respectiv $B D$.\
  a) Arătați că segmentele $D H_1, A H_1, B H_3$ și $C H_4$ au același mijloc.\
  b) Dacă $P$ și $Q$ sunt mijloacele segmentelor $D H_1$, respectiv $M N$, arătați că punctele $O, P$ și $Q$ sunt coliniare. 
]

#proof[
  a) Folosim relația lui Sylvester: $arrow(O H) = arrow(O A) + arrow(O B) + arrow(O C)$.\
  Ortocentrul $H_1$ al $Delta A B C$ verifică $arrow(O H_1) = arrow(O A) + arrow(O B) + arrow(O C)$.\
  Fie $E$ mijlocul segmentului $D H_1$. Vectorul său de poziție este:
  $ arrow(O E) = (arrow(O D) + arrow(O H_1))/2 = (arrow(O D) + arrow(O A) + arrow(O B) + arrow(O C))/2 $
  Expresia este simetrică în raport cu $A, B, C, D$.
  Dacă calculăm mijlocul segmentului $A H_2$ (unde $H_2$ e ortocentrul $B C D$), obținem aceeași sumă.
  Astfel, toate cele 4 segmente au același mijloc $E$ (acesta este punctul Mathot al patrulaterului).

  b) Punctul $P$ este chiar $E$ de la punctul anterior, deci $arrow(O P) = 1/2 (arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D))$.\
  Punctul $Q$ este mijlocul lui $M N$.\
  $M$ mijloc $A C => arrow(O M) = (arrow(O A)+arrow(O C))/2$.\
  $N$ mijloc $B D => arrow(O N) = (arrow(O B)+arrow(O D))/2$.\
  $Q$ mijloc $M N => arrow(O Q) = (arrow(O M)+arrow(O N))/2 = (arrow(O A)+arrow(O B)+arrow(O C)+arrow(O D))/4$.\
  Observăm că $arrow(O P) = 2 arrow(O Q)$.\
  Aceasta înseamnă că vectorii sunt coliniari și au originea comună $O$, deci punctele $O, Q, P$ sunt coliniare.
]

// ============================================================================
// PROBLEMA 25348
// ============================================================================
#problem(25348, author: $ast ast ast$)[
  a) Fie $n in NN*$. Arătați că există $p, q in NN^*$, cu $3q^2 = p^2 - 1$, astfel încât $(2 + sqrt(3))^n = p + q sqrt(3)$\
  b) Demonstrați că numarul $floor((2+sqrt(3))^n)$ este un număr natural impar, unde $floor(a)$ reprezintă partea întreagă a numărului real $a$.
]

#proof[
  a) Demonstrăm prin inducție matematică după $n$.\
  Proprietatea $P(n)$: Există $p_n, q_n in NN^*$ astfel încât $(2 + sqrt(3))^n = p_n + q_n sqrt(3)$ și $p_n^2 - 3q_n^2 = 1$.

  *Etapa de verificare ($n=1$):*
  $ (2 + sqrt(3))^1 = 2 + 1 sqrt(3) $
  Aici $p_1 = 2, q_1 = 1$. Verificăm condiția: $p_1^2 - 3q_1^2 = 2^2 - 3(1)^2 = 4 - 3 = 1$.\
  Relația este adevărată.

  *Etapa de demonstrație:*\
  Presupunem $P(k)$ adevărată: $(2 + sqrt(3))^k = p_k + q_k sqrt(3)$ cu $p_k^2 - 3q_k^2 = 1$.\
  Demonstrăm pentru $P(k+1)$:
  $ (2 + sqrt(3))^(k+1) = (2 + sqrt(3))^k dot (2 + sqrt(3)) $
  Folosind ipoteza inductivă:
  $ = (p_k + q_k sqrt(3))(2 + sqrt(3)) $
  $ = 2p_k + p_k sqrt(3) + 2q_k sqrt(3) + 3q_k $
  $ = (2p_k + 3q_k) + (p_k + 2q_k)sqrt(3) $
  
  Notăm $p_(k+1) = 2p_k + 3q_k$ și $q_(k+1) = p_k + 2q_k$.\
  Deoarece $p_k, q_k in NN^*$, rezultă evident că $p_(k+1), q_(k+1) in NN^*$.
  
  Verificăm relația pătratică pentru $k+1$:
  $ p_(k+1)^2 - 3q_(k+1)^2 = (2p_k + 3q_k)^2 - 3(p_k + 2q_k)^2 $
  $ = (4p_k^2 + 12p_k q_k + 9q_k^2) - 3(p_k^2 + 4p_k q_k + 4q_k^2) $
  $ = 4p_k^2 + 12p_k q_k + 9q_k^2 - 3p_k^2 - 12p_k q_k - 12q_k^2 $
  $ = p_k^2 - 3q_k^2 $
  
  Din ipoteza inductivă știm că $p_k^2 - 3q_k^2 = 1$, deci $p_(k+1)^2 - 3q_(k+1)^2 = 1$.
  Conform inducției, proprietatea este adevărată pentru orice $n in NN^*$.

  b) Fie $x_n = (2+sqrt(3))^n = p_n + q_n sqrt(3)$.
  Considerăm conjugatul $y_n = (2-sqrt(3))^n$. Analog inducției de mai sus, se arată că $y_n = p_n - q_n sqrt(3)$ (doar semnul diferă).
  Adunăm cele două relații:
  $ x_n + y_n = (p_n + q_n sqrt(3)) + (p_n - q_n sqrt(3)) = 2p_n $
  Numărul $2p_n$ este un întreg par.
  
  Analizăm numărul $y_n$:\
  Deoarece $1 < sqrt(3) < 2 => -1 < 2-sqrt(3) < 1$.\
  Mai precis, $2 approx 1.73 => 2-sqrt(3) approx 0.27 in (0, 1)$.\
  Atunci puterea sa $y_n = (2-sqrt(3))^n$ este tot în intervalul $(0, 1)$.
  
  Avem $x_n = 2p_n - y_n$.
  Deoarece $y_n$ este o fracție subunitară pozitivă, $x_n$ este cu puțin mai mic decât întregul $2p_n$.
  $ 2p_n - 1 < 2p_n - y_n < 2p_n $
  Rezultă că partea întreagă este:
  $ floor(x_n) = 2p_n - 1 $
  Fiind de forma $2k-1$, acesta este un număr natural impar.
]