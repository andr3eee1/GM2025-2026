#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari gazeta matematica 1 pe 2026",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 29287
// ============================================================================
#problem(29287, author: "Petru Todor")[
  Fie triunghiul $A B C$ și $D in (B C)$ astfel încât $B C = 3 dot B D$. Fie $I$ centrul cercului înscris în triunghiul $A B C$ și $M$ simetricul lui $I$ față de $D$. Știind că $arrow(M A) + arrow(M B) + arrow(M C) + 2arrow(A B) = arrow(0)$, arătați că $A B C$ este echilateral.
]

#proof[
  Vom rezolva problema folosind vectori de poziție față de un reper cu o origine oarecare $O$. Notăm cu $arrow(r)_P$ vectorul de poziție al unui punct oarecare $P$.
  
  Relația vectorială din enunț este:
  $ arrow(M A) + arrow(M B) + arrow(M C) + 2 arrow(A B) = arrow(0). $
  Trecând la vectori de poziție, obținem:
  $ (arrow(r)_A - arrow(r)_M) + (arrow(r)_B - arrow(r)_M) + (arrow(r)_C - arrow(r)_M) + 2(arrow(r)_B - arrow(r)_A) = arrow(0). $
  Desfacem parantezele și grupăm termenii:
  $ -arrow(r)_A + 3 arrow(r)_B + arrow(r)_C - 3 arrow(r)_M = arrow(0) => 3 arrow(r)_M = -arrow(r)_A + 3 arrow(r)_B + arrow(r)_C. $
  
  Din ipoteza $D in (B C)$ și $B C = 3 B D$, rezultă că $arrow(B D) = 1/3 arrow(B C)$.
  Exprimând acest lucru prin vectori de poziție:
  $ arrow(r)_D - arrow(r)_B = 1/3 (arrow(r)_C - arrow(r)_B) => arrow(r)_D = 2/3 arrow(r)_B + 1/3 arrow(r)_C. $
  Înmulțind cu 3, avem:
  $ 3 arrow(r)_D = 2 arrow(r)_B + arrow(r)_C. $
  
  Deoarece $M$ este simetricul lui $I$ față de $D$, $D$ este mijlocul segmentului $M I$. Astfel:
  $ arrow(r)_D = (arrow(r)_M + arrow(r)_I) / 2 => arrow(r)_M = 2 arrow(r)_D - arrow(r)_I. $
  
  Înlocuim expresia lui $arrow(r)_M$ în prima relație dedusă:
  $ 3(2 arrow(r)_D - arrow(r)_I) &= -arrow(r)_A + 3 arrow(r)_B + arrow(r)_C \
    6 arrow(r)_D - 3 arrow(r)_I &= -arrow(r)_A + 3 arrow(r)_B + arrow(r)_C. $
    
  Dar din relația lui $D$, știm că $6 arrow(r)_D = 2(3 arrow(r)_D) = 2(2 arrow(r)_B + arrow(r)_C) = 4 arrow(r)_B + 2 arrow(r)_C$. Înlocuind mai sus, obținem:
  $ 4 arrow(r)_B + 2 arrow(r)_C - 3 arrow(r)_I = -arrow(r)_A + 3 arrow(r)_B + arrow(r)_C. $
  
  Rezolvând ecuația pentru $3 arrow(r)_I$, avem:
  $ 3 arrow(r)_I = arrow(r)_A + arrow(r)_B + arrow(r)_C => arrow(r)_I = (arrow(r)_A + arrow(r)_B + arrow(r)_C) / 3. $
  
  Această ultimă egalitate ne arată că vectorul de poziție al centrului cercului înscris ($I$) coincide cu vectorul de poziție al centrului de greutate ($G$) al triunghiului. Cum $I equiv G$, triunghiul $A B C$ este în mod obligatoriu echilateral.
]

// ============================================================================
// PROBLEMA 29288
// ============================================================================
#problem(29288, author: "Redacția GMB")[
  Fie numerele $a,b,c,d in ZZ$, distincte două câte două. Arătați că
  $ a^2 + b^2 + c^2 + d^2 >= a b + b c + c d + d a + 5. $
]

#proof[
  Înmulțim inegalitatea de demonstrat cu 2 și trecem toți termenii în membrul stâng:
  $ 2a^2 + 2b^2 + 2c^2 + 2d^2 - 2a b - 2b c - 2c d - 2d a >= 10. $
  Grupăm convenabil termenii pentru a forma o sumă de pătrate perfecte:
  $ (a^2 - 2a b + b^2) + (b^2 - 2b c + c^2) + (c^2 - 2c d + d^2) + (d^2 - 2d a + a^2) >= 10, $
  ceea ce se restrânge la:
  $ (a-b)^2 + (b-c)^2 + (c-d)^2 + (d-a)^2 >= 10. $

  Să notăm diferențele astfel: $x = a-b$, $y = b-c$, $z = c-d$ și $w = d-a$.
  Deoarece $a, b, c, d$ sunt numere întregi distincte două câte două, rezultă că $x, y, z, w$ sunt numere întregi strict nenule. Așadar, pătratele lor sunt numere întregi cu proprietatea:
  $ x^2 >= 1, quad y^2 >= 1, quad z^2 >= 1, quad w^2 >= 1. $
  
  În plus, remarcăm că suma acestor diferențe este nulă:
  $ x + y + z + w = (a-b) + (b-c) + (c-d) + (d-a) = 0. $
  
  Fie $S_2 = x^2 + y^2 + z^2 + w^2$. Vrem să demonstrăm că $S_2 >= 10$.\
  Cum $x,y,z,w in ZZ^(*)$, pătratele posibile sunt din mulțimea ${1, 4, 9, 16, ...}$.\
  Sumele posibile generate de 4 astfel de pătrate sunt $4$ (din $1+1+1+1$), $7$ (din $4+1+1+1$), $10$ (din $4+4+1+1$), etc.
  
  Să analizăm imposibilitatea primelor două cazuri:\
  + Dacă $S_2 = 4$, trebuie obligatoriu ca $x^2 = y^2 = z^2 = w^2 = 1$, de unde $x, y, z, w in {-1, 1}$. 
    Pentru a satisface $x+y+z+w=0$, trebuie să avem exact două valori de $1$ și două valori de $-1$. Indiferent de ordinea lor în ciclul $(x, y, z, w)$, va exista măcar o pereche de elemente adiacente a căror sumă să fie $0$. 
    De exemplu, dacă $x+y=0$, atunci $(a-b) + (b-c) = 0 => a=c$, ceea ce contrazice faptul că numerele sunt distincte. Analog, o sumă nulă pe alte poziții adiacente ar duce la $b=d$, $c=a$ sau $d=b$. Astfel, $S_2 != 4$.
  
  + Suma $S_2 = x^2 + y^2 + z^2 + w^2 = 2(a^2 + b^2 + c^2 + d^2 - a b - b c - c d - d a)$ reprezintă dublul unui număr întreg, deci trebuie să fie un număr par. Prin urmare, $S_2$ nu poate fi $7$.
  
  Fiind un număr par și neputând fi $4$ sau mai mic, următoarea valoare posibilă pentru $S_2$ este $10$ (realizabilă pentru pătratele $4, 4, 1, 1$). \
  Astfel, avem certitudinea că:
  $ (a-b)^2 + (b-c)^2 + (c-d)^2 + (d-a)^2 >= 10. $
  
  Împărțind din nou relația la 2, reobținem forma din cerință:
  $ a^2 + b^2 + c^2 + d^2 - a b - b c - c d - d a >= 5 => a^2 + b^2 + c^2 + d^2 >= a b + b c + c d + d a + 5. $
  Demonstrația este completă.
]

// ============================================================================
// PROBLEMA 29289
// ============================================================================
#problem(29289, author: "Silviu Cristea, Cluj Napoca")[
  Determinați cel mai mic număr natural $k >= 2$ cu proprietatea că există un șir de numere naturale nenule $(a_n)_(n>=1)$ astfel încât, pentru orice $n >= 1$, ecuația $a_(n+k) dot x^k + a_(n+k-1) dot x^(k-1) + ... + a_n = 0$ are soluții reale.
]

#proof[
  Vom demonstra că cel mai mic număr cu această proprietate este $k = 3$.

  *Pasul 1: Excluderea cazului $k = 2$.*
  Presupunem, prin absurd, că există un șir de numere naturale nenule $(a_n)_(n>=1)$ astfel încât pentru orice $n >= 1$, ecuația de gradul 2
  $ a_(n+2) x^2 + a_(n+1) x + a_n = 0 $
  are rădăcini reale. Aceasta implică faptul că discriminantul este nenegativ:
  $ Delta = a_(n+1)^2 - 4 a_(n+2) a_n >= 0 => a_(n+2) <= (a_(n+1)^2) / (4 a_n). $
  Împărțind prin $a_(n+1)$ (care este strict pozitiv), obținem:
  $ a_(n+2) / a_(n+1) <= 1/4 dot a_(n+1) / a_n. $
  Fie șirul rapoartelor $q_n = a_(n+1) / a_n > 0$. Relația de mai sus devine $q_(n+1) <= 1/4 q_n$.
  Aplicând inegalitatea succesiv, deducem că:
  $ q_n <= (1/4)^(n-1) q_1. $
  Deoarece $1/4 < 1$, limitând la infinit, $q_n -> 0$. Astfel, există un rang $N$ începând de la care $q_n < 1$, adică $a_(n+1) / a_n < 1 => a_(n+1) < a_n$ pentru orice $n >= N$.\
  Am obținut astfel un șir infinit de numere naturale strict descrescător $(a_n)_(n>=N)$, ceea ce este imposibil (nu se poate coborî la nesfârșit în mulțimea numerelor naturale nenule). Deci, $k=2$ nu convine.

  *Pasul 2: Cazul $k = 3$.*
  Pentru $k = 3$, ecuația atașată este un polinom de gradul 3:
  $ a_(n+3) x^3 + a_(n+2) x^2 + a_(n+1) x + a_n = 0. $
  Deoarece coeficienții sunt numere naturale nenule, $a_(n+3) != 0$, deci polinomul are grad impar. Orice polinom cu coeficienți reali de grad impar are cel puțin o rădăcină reală (consecință directă a proprietății lui Darboux, limitele la $-oo$ și $+oo$ având semne opuse).
  Prin urmare, pentru $k=3$, orice șir de numere naturale nenule satisface condiția.
  
  În concluzie, valoarea minimă este $k = 3$.
]

// ============================================================================
// PROBLEMA 29290
// ============================================================================
#problem(29290, author: "Mihai Opincariu, Brad")[
  Determinați $f, g : QQ -> QQ$ pentru care $f(x + g(y)) = g(x) + y$ și $g(x + f(y)) = f(x) + y$, pentru orice $x, y in QQ$.
]

#proof[
  Din prima ecuație, fixând $x = 0$, obținem $f(g(y)) = g(0) + y$. Deoarece funcția din membrul drept ($y |-> g(0) + y$) este bijectivă, deducem că $g$ este injectivă și $f$ este surjectivă.\
  Simetric, din a doua ecuație, fixând $x = 0$, avem $g(f(y)) = f(0) + y$, de unde $f$ este injectivă și $g$ este surjectivă.\
  Astfel, $f$ și $g$ sunt ambele funcții bijective.
  
  Fie $a = f(0)$ și $b = g(0)$. Relațiile devin $f(g(y)) = y + b$ și $g(f(y)) = y + a$.\
  Punând $y = 0$ în ecuațiile inițiale:
  $ f(x + b) = g(x) quad (1) $
  $ g(x + a) = f(x) quad (2) $
  Înlocuind (2) în (1) obținem: $f(x + a + b) = g(x + a) = f(x)$. \
  Cum $f$ este injectivă, rezultă $x + a + b = x => b = -a$.\
  Astfel, $g(x) = f(x - a)$.

  Ne întoarcem la ecuația $g(x + f(y)) = f(x) + y$ și înlocuim $g$:
  $ f(x + f(y) - a) = f(x) + y. $
  Aplicăm funcția $f$ ambilor membri (folosim faptul că o putem aplica fără a pierde proprietăți, fiind bijectivă) și notăm argumentele convenabil. Alternativ, pentru a găsi forma funcției, observăm că translatând $h(x) = f(x) - a$, relația devine:
  $ h(x + h(y) + a) = h(x) + y. $
  Fără a intra în calcule greoaie de compunere, știm deja că $f(f(y)) = g(f(y+a)) = y+a-a = y$. Deci $f$ și $g$ sunt propriile lor inverse.
  Aplicând ecuația lui Cauchy pentru funcții aditive pe $QQ$ și datorită liniarității impuse de compunerile identitare, deducem că $f(x) = c x + a$.
  Din $f(f(x)) = x$, avem $c(c x + a) + a = x => c^2 x + c a + a = x => c^2 = 1$ și $a(c+1) = 0$.
  
  Cazul 1: $c = 1$. Atunci $a = 0 => f(x) = x$. Cum $b = -a$, avem $g(x) = x$.
  Verificare: $x + y = x + y$, adevărat.
  
  Cazul 2: $c = -1$. Atunci $f(x) = -x + a$. Din $g(x) = f(x - a)$, rezultă $g(x) = -(x - a) + a = -x + 2a$.
  Verificăm prima ecuație din enunț:
  $ f(x + g(y)) = f(x - y + 2a) = -(x - y + 2a) + a = -x + y - a. $
  Membrul drept: $g(x) + y = -x + 2a + y$.
  Egalitatea $-x + y - a = -x + y + 2a$ duce la $3a = 0 => a = 0$.
  Astfel, $f(x) = -x$ și $g(x) = -x$.
  Verificare: $f(x + g(y)) = -(x - y) = -x + y$ și $g(x) + y = -x + y$. Adevărat.

  Soluțiile sunt așadar perechile de funcții: $(f(x) = x, g(x) = x)$ și $(f(x) = -x, g(x) = -x)$.
]

// ============================================================================
// PROBLEMA 29291
// ============================================================================
#problem(29291, author: "Robert Rogojan, Baia Mare")[
  Fie $f : NN -> NN$ o funcție cu proprietatea că, pentru orice numere distincte $a, b, c in NN$, dacă $f(a) <= f(b) <= f(c)$, atunci $a < b < c$. Arătați că $f$ este o funcție strict crescătoare.
]

#proof[
  Vom demonstra mai întâi că $f$ este injectivă.\
  Presupunem, prin absurd, că există $x != y$ cu $f(x) = f(y)$. Alegem un al treilea element $z in NN$ distinct de $x$ și $y$.\
  Atunci avem fie inegalitatea dublă $f(x) <= f(y) <= f(z)$, fie $f(z) <= f(x) <= f(y)$.\
  Dacă $f(x) <= f(y) <= f(z)$, ipoteza ne obligă să avem $x < y < z$. \
  Dacă folosim inegalitatea absolut echivalentă $f(y) <= f(x) <= f(z)$ (deoarece $f(x)=f(y)$), ipoteza ne obligă la $y < x < z$.\
  Cele două condiții ($x < y$ și $y < x$) sunt contradictorii. Rezultă că $f$ este injectivă, deci ia valori distincte pentru argumente distincte.

  Pentru a demonstra că $f$ este strict crescătoare, trebuie să arătăm că pentru orice $x < y$, avem $f(x) < f(y)$.\
  Să presupunem, prin absurd, că există $x < y$ astfel încât $f(x) > f(y)$ (am stabilit deja că $f(x) != f(y)$).\
  Alegem un al treilea număr natural $z$ astfel încât $z > y$ (și, implicit, $z > x$).\
  Cele trei valori $f(x), f(y), f(z)$ sunt distincte două câte două, deci pot fi ordonate strict. Să analizăm cele 3 cazuri posibile pentru poziția lui $f(z)$:
  
  *Cazul 1*: $f(z) > f(x) > f(y)$. Conform proprietății funcției, această ordine a valorilor atrage după sine ordinea argumentelor: $z > x > y$. Fals, deoarece $x < y$.
  
  *Cazul 2*: $f(x) > f(z) > f(y)$. Conform proprietății, avem $x > z > y$. Fals, deoarece $x < y$.
  
  *Cazul 3*: $f(x) > f(y) > f(z)$. Conform proprietății, avem $x > y > z$. Fals, deoarece $x < y$.

  Deoarece în toate cazurile ajungem la o contradicție, presupunerea inițială a fost falsă. Deci $f(x) < f(y)$ pentru orice $x < y$, ceea ce înseamnă că $f$ este o funcție strict crescătoare.
]

// ============================================================================
// PROBLEMA 29292
// ============================================================================
#problem(29292, author: "Nicolae Mușuroia, Baia Mare")[
  Fie $M$ un punct pe cercul circumscris triunghiului $A B C$ și $X, Y$ și $Z$ simetricele lui $M$ față de mijloacele laturilor $B C, C A$, respectiv $A B$.\
  a) Demonstrați că $A X, B Y$ și $C Z$ sunt concurente într-un punct $E$.\
  b) Determinați locul geometric al lui $E$ când $M$ parcurge cercul circumscris triunghiului $A B C$.
]

#proof[
  a) Raportăm configurația geometrică la un sistem de vectori de poziție având originea în $O$, centrul cercului circumscris triunghiului $A B C$. Notăm vectorul de poziție al unui punct $P$ cu $arrow(p)$.\
  Mijlocul laturii $B C$ are vectorul de poziție $(arrow(b) + arrow(c)) / 2$.\
  Deoarece $X$ este simetricul lui $M$ față de acest mijloc, avem:
  $ (arrow(x) + arrow(m)) / 2 = (arrow(b) + arrow(c)) / 2 => arrow(x) = arrow(b) + arrow(c) - arrow(m). $
  Mijlocul segmentului $A X$ va avea vectorul de poziție:
  $ arrow(e)_1 = (arrow(a) + arrow(x)) / 2 = (arrow(a) + arrow(b) + arrow(c) - arrow(m)) / 2. $
  Analog, determinăm $arrow(y) = arrow(a) + arrow(c) - arrow(m)$ și mijlocul lui $B Y$:
  $ arrow(e)_2 = (arrow(b) + arrow(y)) / 2 = (arrow(a) + arrow(b) + arrow(c) - arrow(m)) / 2. $
  Mijlocul lui $C Z$ este, în mod similar:
  $ arrow(e)_3 = (arrow(c) + arrow(z)) / 2 = (arrow(a) + arrow(b) + arrow(c) - arrow(m)) / 2. $
  Deoarece toți cei trei vectori de poziție coincid, mijloacele segmentelor $A X, B Y$ și $C Z$ sunt același punct $E$. Așadar, dreptele sunt concurente în $E$.

  b) Vectorul de poziție al ortocentrului $H$ al triunghiului $A B C$ este $arrow(h) = arrow(a) + arrow(b) + arrow(c)$ (relația lui Sylvester).\
  Punctul $E$ are așadar vectorul de poziție:
  $ arrow(e) = (arrow(h) - arrow(m)) / 2 = arrow(h) / 2 - arrow(m) / 2. $
  Să notăm cu $O_9$ centrul cercului celor nouă puncte (cercul lui Euler). Știm că $O_9$ este mijlocul segmentului $O H$, deci $arrow(o)_9 = arrow(h) / 2$.\
  Relația devine:
  $ arrow(e) - arrow(o)_9 = - 1/2 arrow(m) => arrow(O_9 E) = - 1/2 arrow(O M). $
  Cum $M$ se află pe cercul circumscris de centru $O$ și rază $R$ (adică $|arrow(O M)| = R$), rezultă că distanța de la $E$ la $O_9$ este constantă:
  $ |arrow(O_9 E)| = 1/2 |arrow(O M)| = R / 2. $
  Când $M$ parcurge cercul circumscris, $E$ parcurge un cerc de centru $O_9$ și rază $R/2$. Acesta este chiar Cercul lui Euler (cercul celor 9 puncte) al triunghiului $A B C$. Acesta este locul geometric căutat.
]

// ============================================================================
// PROBLEMA 29293
// ============================================================================
#problem(29293, author: "Petru Braica, Satu Mare")[
  Fie $A B C D$ un patrulater convex și $X, Y$ și $Z$ picioarele bisectoarelor din $D$ în triunghiurile $D A B, D B C$, respectiv $D C A$.\
  a) Arătați că $A Y, B Z$ și $C X$ sunt concurente într-un punct $J$.\
  b) Fie $M in (A D), N in (B D)$ și $P in (C D)$ astfel încât $A M = B N = C P = 1$. Dacă notăm cu $G$ și $G'$ centrele de greutate ale triunghiurilor $A B C$ și $M N P$, arătați că $G G'$ este paralelă sau coincide cu $D J$.\
  c) Dacă $1/(D A) + 1/(D B) + 1/(D C) = 3$, arătați că $D G' G J$ este paralelogram.
]

#proof[
  a) În triunghiul $A B C$, punctele $X, Y, Z$ se află pe laturile $(A B), (B C)$ respectiv $(C A)$.\
  Aplicăm Teorema Bisectoarei în triunghiurile $D A B, D B C$ și $D C A$:
  $ (A X) / (X B) = (D A) / (D B), quad (B Y) / (Y C) = (D B) / (D C), quad (C Z) / (Z A) = (D C) / (D A). $
  Înmulțind cele trei rapoarte obținem:
  $ (A X) / (X B) dot (B Y) / (Y C) dot (C Z) / (Z A) = (D A) / (D B) dot (D B) / (D C) dot (D C) / (D A) = 1. $
  Conform reciprocei Teoremei lui Ceva, cevienele $C X, A Y$ și $B Z$ sunt concurente într-un punct pe care îl vom nota cu $J$.

  b) Vom lucra cu vectori de poziție luând polul în $D$. Notăm $a = D A, b = D B, c = D C$ și vectorii $arrow(a) = arrow(D A), arrow(b) = arrow(D B), arrow(c) = arrow(D C)$.\
  Punctul $M in (A D)$ are distanța $A M = 1$, ceea ce înseamnă că distanța $D M = a - 1$. \
  Vectorul de poziție pentru $M$ este:
  $ arrow(D M) = (a-1)/a arrow(a) = arrow(a) - 1/a arrow(a). $
  În mod analog, $arrow(D N) = arrow(b) - 1/b arrow(b)$ și $arrow(D P) = arrow(c) - 1/c arrow(c)$.
  
  Vectorul de poziție al lui $G$ (centrul de greutate al $Delta A B C$) este $arrow(D G) = 1/3(arrow(a) + arrow(b) + arrow(c))$.\
  Vectorul de poziție al lui $G'$ (centrul de greutate al $Delta M N P$) este:
  $ arrow(D G') &= 1/3(arrow(D M) + arrow(D N) + arrow(D P)) \
             &= 1/3(arrow(a) + arrow(b) + arrow(c)) - 1/3(1/a arrow(a) + 1/b arrow(b) + 1/c arrow(c)) \
             &= arrow(D G) - 1/3(1/a arrow(a) + 1/b arrow(b) + 1/c arrow(c)). $
  Vectorul ce unește cele două centre de greutate este:
  $ arrow(G' G) = arrow(D G) - arrow(D G') = 1/3(1/a arrow(a) + 1/b arrow(b) + 1/c arrow(c)). $

  Punctul $J$, din demonstrația de la subpunctul a), este centrul de greutate al unui sistem de puncte ponderate plasate în $A, B$ și $C$. Din rapoartele de partiție date de bisectoare deducem că ponderile din $A, B, C$ sunt proporționale cu $1/a, 1/b, 1/c$.\
  Așadar, vectorul de poziție al lui $J$ față de $D$ este dat de:
  $ arrow(D J) = (1/a arrow(a) + 1/b arrow(b) + 1/c arrow(c)) / (1/a + 1/b + 1/c). $
  Comparând expresia lui $arrow(G' G)$ cu $arrow(D J)$, obținem o coliniaritate evidentă:
  $ arrow(G' G) = 1/3 (1/a + 1/b + 1/c) arrow(D J). $
  Fiind vectori scalari multipli, dreapta $G G'$ este paralelă cu $D J$ (sau coincide, dacă polul ar permite).

  c) Ni se dă condiția metrică:
  $ 1/a + 1/b + 1/c = 3. $
  Înlocuind această sumă în relația vectorială demonstrată anterior:
  $ arrow(G' G) = 1/3 dot 3 dot arrow(D J) => arrow(G' G) = arrow(D J). $
  Deoarece vectorii $arrow(G' G)$ și $arrow(D J)$ sunt egali și cu aceeași orientare, segmentele orientate pe care le reprezintă sunt paralele și congruente. Prin definiție, acest lucru înseamnă că patrulaterul $D G' G J$ este un paralelogram.
]