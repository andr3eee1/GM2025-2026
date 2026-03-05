#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari suplimentul gazetei matematice 12",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 25385
// ============================================================================
#problem(25385, author: "Elisabeta și Daniel Stanciu")[
  Fie $f : RR -> RR$ funcția definită prin $f(x) = sqrt(x^2-4x+4)$, pentru orice $x in RR$ și funcția liniara $g : RR -> RR$ pentru care $g(x-1) + g(x+1) = 4x$, pentru orice $x in RR$. Determinați coordonatele punctelor de intersecție a graficelor celor două funcții.
]

#proof[
  $f(x) = sqrt(x^2-4x+4) => f(x) = sqrt((x-2)^2) = abs(x-2) => underline(f(x) = abs(x-2))$\
  $g(x) = a x + b$, $g(x-1) + g(x+1) = 4x => a(x-1)+b + a(x+1)+b = 4x => 2a x+2b = 4x => a x + b = 2x => underline(g(x) = 2x)$

  Trebuie să găsim un punct $A(x_A,f(x_A))$ care să coincida cu $B(x_A,g(x_A))$\
  Deci vrem ca $f(x_A) = g(x_A) => abs(x_A-2) = 2x_A$
  - dacă $x_A >= 2 => abs(x_A-2) = x_A - 2 => x_A = -2 < 2 =>$ nu convine
  - daca $x_A < 2 => abs(x_A-2) = 2 - x_A => 3x_A = 2 => underline(x_A = 2/3)$ soluție
]

// ============================================================================
// PROBLEMA 25386
// ============================================================================
#problem(25386, author: "Ludovica Lazăr")[
  Rezolvați în $RR$ ecuația
  $ lr(floor((6076x-4053)/(3x-2)) + {(x-3)/(3x-2)}) = 2025 $
]

#proof[
  Putem scrie partea întreagă astfel
  $ floor((2025 dot 3x - 2025 dot 2 + x - 3)/(3x-2)) = floor((2025(3x-2)+x-3)/(3x-2)) = 2025 + floor((x-3)/(3x-2)) $
  Deci ecuația devine
  $ cancel(2025) + floor((x-3)/(3x-2)) + {(x-3)/(3x-2)} = cancel(2025) $
  $ (x-3)/(3x-2) = 0 => #rect[$x = 3$] $
]

// ============================================================================
// PROBLEMA 25387
// ============================================================================
#problem(25387, author: "Mihaela Mioara Mirea și Daniela Beldea")[
  Rezolvați în $RR$ ecuația
  $ floor(x^5) + floor(x^4) + floor(x^3) + floor(x^2) + floor(x) + 1 = {x} $
]

#proof[
  Membrul stâng este întreg, deci ${x} in ZZ => {x} = 0 => x in ZZ => x^k in ZZ quad forall k in NN$, deci ecuația devine
  $ x^5 + x^4 + x^3 + x^2 + x + 1 = 0 $
  $ x^3(x^2+x+1) + (x^2+x+1) = 0 $
  $ (x^2+x+1)(x^3+1) = 0 $
  $ (x^2+1+x)(x+1)(x^2-x+1) = 0 $
  $ [(x^2+1)^2-1](x+1) = 0 $
  - Daca $x+1 = 0 => #rect[$x=-1$]$
  - Daca $(x^2+1)^2-1 = 0 => x^2+1 = plus.minus 1 => x^2 = plus.minus 1 - 1 => x^2 = 0 => x=0$, care nu verifică în ecuația inițială.
  Deci $underline(x=-1)$ soluție unică.
]

// ============================================================================
// PROBLEMA 25388
// ============================================================================
#problem(25388, author: "Sorin Monel Budișan")[
  Fie $a,b,c>0$ pentru care $c<=b<a<b+c$. Arătați că
  $ sqrt(2(b^2+c^2) - a^2) + sqrt(2(a^2+c^2) - b^2) > sqrt(2(a^2+b^2) - c^2) $
]

#proof[
  Observăm că $sqrt(2(b^2+c^2) - a^2) = 2m_a$, unde $m_a$ este lungimea medianei corespunzătoare laturii $a$.\
  Deci trebuie să demonstrăm că $2(m_a+m_b)>2m_c => m_a+m_b>m_c$. Aplicând inegalitatea triunghiului în triunghiurile formate de mediana si celalte laturi, obținem urmatoarele două relații:
  $ m_a+a/2>b $
  $ m_b+b/2>a $
  Adunându-le obținem
  $ m_a+m_b>(a+b)/2 > m_c "(din formula lungimii medianei)" $
  Atenție, putem reduce problema la una de geometrie, datorită inegalitățiilor date în enunț!
]

// ============================================================================
// PROBLEMA 25389
// ============================================================================
#problem(25389)[
  Fie $f : [0,1] -> RR$ o funcție cu proprietățile:\
  (i) $f(1)=1$;\
  (ii) $f(x)>=0, forall x in [0,1];$\
  (iii) Dacă $x,y$ și $x+y$ sunt din $[0,1]$, atunci $f(x+y)>=f(x)+f(y)$.\
  Demonstrați că $f(x)<=2x, forall x in [0,1]$
]

#proof[
  Vom demonstra inegalitatea analizând separat cazurile pentru valorile lui $x$.

  Din proprietatea (iii), pentru orice $n in NN^*$ și orice $x in [0,1]$ astfel încât $n x <= 1$, putem aplica inegalitatea succesiv:
  $ f(n x) = f(x + (n-1)x) >= f(x) + f((n-1)x) >= ... >= n f(x). $

  Mai întâi, pentru $x = 0$, avem $f(0) = f(0+0) >= f(0) + f(0)$, de unde $f(0) <= 0$. Cum din (ii) știm că $f(x) >= 0$, rezultă $f(0) = 0$. Inegalitatea $0 <= 2(0)$ este evident respectată.

  Pentru $x in (1/2, 1]$, avem $1 - x in [0, 1/2) subset [0,1]$. Aplicând (iii) și apoi (i), obținem:
  $ 1 = f(1) = f(x + (1-x)) >= f(x) + f(1-x). $
  Deoarece $f(1-x) >= 0$ conform (ii), deducem că $f(x) <= 1$. Cum $x > 1/2$, avem $2x > 1$, deci $f(x) <= 1 < 2x$.

  Pentru $x in (0, 1/2]$, fie $n = floor(1/x)$. Deoarece $x <= 1/2$, avem $1/x >= 2$, deci $n$ este un număr natural cu $n >= 2$.
  Prin definiția părții întregi, avem $n <= 1/x < n+1$, ceea ce conduce la:
  $ n x <= 1 quad "și" quad x > 1/(n+1). $
  
  Folosind inegalitatea dedusă inițial, avem $f(n x) >= n f(x)$. Mai mult, deoarece $n x <= 1$, numărul $1 - n x in [0, 1]$. Putem scrie:
  $ 1 = f(1) = f(n x + (1 - n x)) >= f(n x) + f(1 - n x). $
  
  Cum $f(1 - n x) >= 0$, obținem:
  $ 1 >= f(n x) >= n f(x) => f(x) <= 1/n. $
  
  Acum, deoarece $x > 1/(n+1)$, rezultă $2x > 2/(n+1)$. 
  Pentru a finaliza demonstrația, este suficient să arătăm că $1/n <= 2/(n+1)$. Această inegalitate este echivalentă cu:
  $ n + 1 <= 2n <=> n >= 1, $
  lucru evident adevărat deoarece am stabilit deja că $n >= 2$.

  Prin urmare, punând cap la cap inegalitățile, obținem:
  $ f(x) <= 1/n <= 2/(n+1) < 2x, $
  deci $f(x) <= 2x$ pentru orice $x in [0, 1]$.
]

// ============================================================================
// PROBLEMA 25390
// ============================================================================
#problem(25390)[
  Se consideră șirul $(x_n)_(n>=1)$ definit prin $x_(n+1) = a x_n + b$, unde $x_1, a, b in RR$, $a != 1$ sunt date.\
  a) Arătați că, dacă $r$ este rădăcina ecuației $x = a x + b$, atunci șirul $(x_n - r)_(n>=1)$ este progresie aritmetică de rație $a$.\
  b) Determinați termenul general al șirului $(x_n)_(n>=1)$.\
  c) Determinați termenul general al șirului $(u_n)_(n>=1)$ definit prin relațiile $u_1 = 1$ și $u_(n+1) = 3 u_n + 2, forall n >= 1$. 
]

#proof[
  a) Deoarece $r$ este rădăcina ecuației date, avem $r = a r + b$, de unde putem deduce că $b = r(1-a)$.
  Calculăm diferența $x_(n+1) - r$:
  $ x_(n+1) - r = (a x_n + b) - r = a x_n + r(1-a) - r = a x_n - a r = a(x_n - r). $
  Deoarece raportul $(x_(n+1) - r) / (x_n - r) = a$ este constant, rezultă că șirul ajutător definit de $y_n = x_n - r$ este o progresie geometrică de rație $q = a$.
  *(Notă: În enunțul problemei, cuvântul pare a fi "aritmetică" dintr-o eroare de tipar a cărții, însă raționamentul matematic corect implică o progresie geometrică).*

  b) Folosind formula termenului general pentru o progresie geometrică, avem:
  $ y_n = y_1 a^(n-1) => x_n - r = (x_1 - r) a^(n-1). $
  Din $r = a r + b$ obținem $r = b / (1-a)$ (deoarece $a != 1$). Înlocuind $r$, termenul general este:
  $ x_n = (x_1 - b / (1-a)) a^(n-1) + b / (1-a). $

  c) Identificăm coeficienții relației de recurență $u_(n+1) = 3 u_n + 2$: avem $a = 3$ și $b = 2$, cu $u_1 = 1$.
  Rădăcina ecuației $r = 3r + 2$ este $r = -1$.
  Aplicând direct formula obținută la punctul b):
  $ u_n = (1 - (-1)) 3^(n-1) + (-1) = 2 dot 3^(n-1) - 1. $
]

// ============================================================================
// PROBLEMA 25391
// ============================================================================
#problem(25391)[
  În paralelogramul $A B C D$ avem $A B = 4$, $B D = 3$, $B C = 2$. Fie $G$ centrul de greutate al triunghiului $A B D$, $I$ centrul cercului înscris în triunghiul $B C D$ și $M in (B C)$ astfel încât $B M = 2 M C$. Demonstrați că:\
  a) $arrow(P I) = (4 arrow(P B) + 3 arrow(P C) + 2 arrow(P D)) / 9$, oricare ar fi punctul $P$ din planul paralelogramului;\
  b) punctele $G, I$ și $M$ sunt coliniare.
]

#proof[
  a) În triunghiul $B C D$, lungimile laturilor opuse vârfurilor $B, C, D$ sunt:
  $ C D = A B = 4, quad B D = 3, quad B C = 2. $
  Poziția centrului cercului înscris $I$ față de un punct oarecare $P$ este dată de media ponderată a vectorilor de poziție ai vârfurilor, cu ponderi egale cu lungimile laturilor opuse:
  $ arrow(P I) = (C D dot arrow(P B) + B D dot arrow(P C) + B C dot arrow(P D)) / (C D + B D + B C). $
  Înlocuind valorile numerice, obținem:
  $ arrow(P I) = (4 arrow(P B) + 3 arrow(P C) + 2 arrow(P D)) / (4 + 3 + 2) = (4 arrow(P B) + 3 arrow(P C) + 2 arrow(P D)) / 9. $

  b) Exprimăm vectorii de poziție pentru $G$ și $M$. 
  $G$ este centrul de greutate al $Delta A B D$:
  $ arrow(P G) = (arrow(P A) + arrow(P B) + arrow(P D)) / 3. $
  Deoarece $A B C D$ este paralelogram, avem regula paralelogramului $arrow(P A) + arrow(P C) = arrow(P B) + arrow(P D)$, deci $arrow(P A) = arrow(P B) + arrow(P D) - arrow(P C)$. Înlocuind în $arrow(P G)$:
  $ 3 arrow(P G) = 2 arrow(P B) - arrow(P C) + 2 arrow(P D). $
  Pentru punctul $M in (B C)$ cu $B M = 2 M C$, obținem din formula raportului în care un punct împarte un segment:
  $ arrow(P M) = (arrow(P B) + 2 arrow(P C)) / (1 + 2) => 3 arrow(P M) = arrow(P B) + 2 arrow(P C). $
  Plecând de la relația demonstrată la punctul a):
  $ 9 arrow(P I) = 4 arrow(P B) + 3 arrow(P C) + 2 arrow(P D). $
  Grupăm convenabil termenii pentru a folosi $arrow(P G)$ și $arrow(P M)$:
  $ 9 arrow(P I) &= (2 arrow(P B) - arrow(P C) + 2 arrow(P D)) + (2 arrow(P B) + 4 arrow(P C)) \
             &= 3 arrow(P G) + 2 (arrow(P B) + 2 arrow(P C)) \
             &= 3 arrow(P G) + 6 arrow(P M). $
  Împărțind prin 9, obținem:
  $ arrow(P I) = 1/3 arrow(P G) + 2/3 arrow(P M). $
  Deoarece suma coeficienților este $1/3 + 2/3 = 1$, rezultă că $I$ este o combinație afină a punctelor $G$ și $M$, deci punctele $G, I, M$ sunt coliniare.
]

// ============================================================================
// PROBLEMA 25392
// ============================================================================
#problem(25392)[
  Fie triunghiul $A B C$ și $A D, B E, C F$ trei ceviene concurente în punctul $M$, unde $D in (B C), E in (C A), F in (A B)$. Demonstrați inegalitățile:\
  a) $(M A) / (M D) + (M B) / (M E) + (M C) / (M F) >= 6$;\
  b) $(M A) / (M D) dot (M B) / (M E) dot (M C) / (M F) >= 8$.\
  Determinați, în fiecare caz, poziția punctului $M$ pentru care are loc egalitatea.
]

#proof[
  Vom folosi metoda ariilor. Notăm ariile triunghiurilor componente astfel: $x = cal(A)_(Delta B M C)$, $y = cal(A)_(Delta C M A)$ și $z = cal(A)_(Delta A M B)$.\
  Deoarece $Delta A M B$ și $Delta D M B$ au aceeași înălțime din $B$, iar $Delta A M C$ și $Delta D M C$ au aceeași înălțime din $C$, rapoartele segmentelor se pot scrie ca:
  $ (M A) / (M D) = (cal(A)_(Delta A M B) + cal(A)_(Delta A M C)) / cal(A)_(Delta B M C) = (y + z) / x. $
  Analog, obținem:
  $ (M B) / (M E) = (z + x) / y quad "și" quad (M C) / (M F) = (x + y) / z. $

  a) Suma devine:
  $ S = (y + z) / x + (z + x) / y + (x + y) / z = (x/y + y/x) + (y/z + z/y) + (z/x + x/z). $
  Aplicând inegalitatea mediilor ($a+b >= 2 sqrt(a b)$) pentru fiecare paranteză:
  $ S >= 2 + 2 + 2 = 6. $
  Egalitatea are loc când $x=y, y=z, z=x$, adică atunci când $x=y=z$, ceea ce înseamnă că punctul de concurență $M$ este centrul de greutate al triunghiului $A B C$.

  b) Produsul devine:
  $ P = (y + z) / x dot (z + x) / y dot (x + y) / z = ((x+y)(y+z)(z+x)) / (x y z). $
  Aplicând din nou inegalitatea mediilor pentru fiecare sumă de la numărător ($x+y >= 2 sqrt(x y)$):
  $ P >= (2 sqrt(x y) dot 2 sqrt(y z) dot 2 sqrt(z x)) / (x y z) = (8 x y z) / (x y z) = 8. $
  La fel ca la punctul precedent, egalitatea se atinge dacă și numai dacă $x=y=z$, deci când $M$ este centrul de greutate al triunghiului $A B C$.
]

// ============================================================================
// PROBLEMA 25393
// ============================================================================
#problem(25393, author: "Florin Rotaru, Focșani")[
  Determinați funcțiile $f : RR -> RR$ pentru care 
  $ f(f(2x - f(y))) = x - y + f(f(x)), forall x, y in RR. $
]

#proof[
  Fie ecuația funcțională dată, pe care o notăm cu $(E)$.
  
  *Pasul 1: Surjectivitatea lui f.*
  Rescriem $(E)$ sub forma:
  $ x - y = f(f(2x - f(y))) - f(f(x)). $
  Fixăm $x = 0$. Obținem $-y = f(f(-f(y))) - f(f(0))$, deci funcția $y |-> -y$ este definită ca o diferență ce implică funcția $f$. Cum partea stângă parcurge tot $RR$ când $y$ parcurge $RR$, rezultă că funcția $f$ (mai precis, compunerea ei exterioară) trebuie să fie surjectivă. Deci $f$ este surjectivă.
  
  Fiind surjectivă, există un număr $c in RR$ astfel încât $f(c) = 0$.
  
  *Pasul 2: Injectivitatea lui f.*
  Presupunem că există $y_1, y_2 in RR$ astfel încât $f(y_1) = f(y_2)$. 
  Înlocuind în $(E)$ pe $y$ succesiv cu $y_1$ și $y_2$, membrul stâng rămâne neschimbat:
  $ f(f(2x - f(y_1))) = f(f(2x - f(y_2))). $
  Prin urmare, membrii drepți trebuie să fie egali:
  $ x - y_1 + f(f(x)) = x - y_2 + f(f(x)) => y_1 = y_2. $
  Deci $f$ este injectivă. Fiind și surjectivă, $f$ este bijectivă.
  
  *Pasul 3: Determinarea lui f.*
  În $(E)$, punem $y = c$ (știm că $f(c) = 0$):
  $ f(f(2x)) = x - c + f(f(x)). quad (1) $
  Acum punem în $(E)$ pe $y = x$:
  $ f(f(2x - f(x))) = f(f(x)). $
  Deoarece $f$ este injectivă, și compunerea $f compose f$ este injectivă. Din relația anterioară obținem direct:
  $ 2x - f(x) = x => f(x) = x, forall x in RR. $
  
  *Verificare:*
  Dacă $f(x) = x$, membrul stâng din $(E)$ devine $f(f(2x - y)) = 2x - y$.
  Membrul drept devine $x - y + f(x) = x - y + x = 2x - y$.
  Egalitatea este verificată pentru orice $x, y$.
  
  În concluzie, singura funcție soluție este $f(x) = x$.
]

// ============================================================================
// PROBLEMA 25394
// ============================================================================
#problem(25394)[
  Fie $A B C$ un triunghi ascuțitunghic și $P$ un punct interior lui. Dreptele $A P, B P$ și $C P$ intersectează a doua oară cercul circumscris triunghiului $A B C$ în punctele $X, Y$, respectiv $Z$. Arătați că bisectoarele unghiurilor $B A C$ și $B P C$ sunt concurente într-un punct de pe latura $B C$ dacă și numai dacă $X Y = X Z$.
]

#proof[
  Fie $D$ punctul în care bisectoarea unghiului $angle.spheric.spheric B A C$ intersectează latura $B C$ și $D'$ punctul în care bisectoarea unghiului $angle.spheric B P C$ intersectează aceeași latură.
  Conform teoremei bisectoarei, avem rapoartele:
  $ (B D) / (D C) = (A B) / (A C) quad "și" quad (B D') / (D' C) = (P B) / (P C). $
  Bisectoarele sunt concurente pe $B C$ dacă și numai dacă $D = D'$, ceea ce este echivalent cu:
  $ (A B) / (A C) = (P B) / (P C) <=> A B dot P C = A C dot P B. quad (*) $

  Să ne îndreptăm acum atenția spre lungimile coardelor $X Y$ și $X Z$.\
  Ne uităm la triunghiurile $Delta P A B$ și $Delta P Y X$. Avem $angle.spheric A P B equiv angle.spheric X P Y$ (unghiuri opuse la vârf). De asemenea, patrulaterul $A B X Y$ fiind inscriptibil, $angle.spheric P A B = angle.spheric X A B equiv angle.spheric X Y B = angle.spheric X Y P$. \
  Rezultă că $Delta P A B tilde Delta P Y X$. Din asemănare deducem proporționalitatea laturilor:
  $ (P B) / (P X) = (A B) / (X Y) => X Y = (A B dot P X) / (P B). $
  
  Prin același raționament, $Delta P A C tilde Delta P Z X$, de unde obținem:
  $ (P C) / (P X) = (A C) / (X Z) => X Z = (A C dot P X) / (P C). $
  
  Condiția din enunț, $X Y = X Z$, devine echivalentă cu:
  $ (A B dot P X) / (P B) = (A C dot P X) / (P C) <=> (A B) / (P B) = (A C) / (P C) <=> A B dot P C = A C dot P B. $
  Observăm că aceasta este exact condiția $(*)$ dedusă anterior pentru concurența bisectoarelor pe latura $B C$. Prin urmare, echivalența este demonstrată.
]

// ============================================================================
// PROBLEMA 25395
// ============================================================================
#problem(25395, author: "Cezar Apostolescu, Ploiești")[
  Pe laturile $A B$ și $A C$ ale triunghiului $A B C$ se consideră punctele $M$, respectiv $N$ și notăm cu $O$ intersecția dintre $B N$ și $C M$. Arătați că mijloacele segmentelor $A O$, $M N$ și $B C$ sunt puncte distincte și coliniare.
]

#proof[
  Problema este o aplicație directă și elegantă a teoremei dreptei lui Newton-Gauss pentru patrulaterul complet.
  
  Să considerăm cele 4 drepte care suportă segmentele date: $A B, A C, C M$ și $B N$. Aceste patru drepte determină un patrulater complet. Vârfurile acestui patrulater complet sunt intersecțiile acestor drepte luate două câte două, adică exact punctele $A, B, C, M, N$ și $O$:
  - Dreptele $(A B)$ și $(A C)$ se intersectează în $A$.
  - Dreptele $(C M)$ și $(B N)$ se intersectează în $O$.
  $A$ și $O$ formează astfel prima pereche de vârfuri opuse, definind o diagonală.
  
  Similar:
  - Dreptele $(A B)$ și $(C M)$ se intersectează în $M$.
  - Dreptele $(A C)$ și $(B N)$ se intersectează în $N$.
  $M$ și $N$ formează a doua pereche de vârfuri opuse, definind a doua diagonală.
  
  - Dreptele $(A B)$ și $(B N)$ se intersectează în $B$.
  - Dreptele $(A C)$ și $(C M)$ se intersectează în $C$.
  $B$ și $C$ formează a treia pereche de vârfuri opuse, definind a treia diagonală.
  
  Așadar, segmentele $A O, M N$ și $B C$ reprezintă exact cele trei diagonale ale patrulaterului complet determinat de dreptele amintite.
  
  Conform teoremei lui Newton-Gauss, mijloacele celor trei diagonale ale oricărui patrulater complet sunt coliniare. Deoarece punctele $M, N$ și $O$ sunt interioare laturilor, respectiv triunghiului, mijloacele nu coincid și dreapta determinată de ele este unică, ceea ce încheie demonstrația.
]