#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari supliment gazeta matematica 9",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 25241
// ============================================================================
#problem(25241)[
  Fie $a, b, c$ numere reale. Arătați că
  $ root(3, a) + root(3, b) + root(3, c) = root(3, a + b + c) $
  dacă și numai dacă
  $ a^3 + b^3 + c^3 = (a + b + c)^3. $
]

#proof[
  Vom demonstra că ambele egalități sunt echivalente cu aceeași condiție: $(a+b)(b+c)(c+a) = 0$.

  *Pasul 1: Analiza primei egalități*
  Notăm $x = root(3, a), y = root(3, b), z = root(3, c)$.
  Astfel, $a = x^3, b = y^3, c = z^3$.
  Prima relație devine:
  $ x + y + z = root(3, x^3 + y^3 + z^3) $
  Ridicăm ambele părți la cub:
  $ (x + y + z)^3 = x^3 + y^3 + z^3 $
  
  Folosim următoarea identitate algebrică pentru cubul trinomului:
  $ (u + v + w)^3 = u^3 + v^3 + w^3 + 3(u + v)(v + w)(w + u) $
  
  Înlocuind în ecuația noastră, termenii la puterea a 3-a se reduc:
  $ cancel(x^3 + y^3 + z^3) + 3(x + y)(y + z)(z + x) = cancel(x^3 + y^3 + z^3) $
  $ 3(x + y)(y + z)(z + x) = 0 $
  
  Aceasta implică faptul că cel puțin o paranteză este 0:
  $ x = -y quad "sau" quad y = -z quad "sau" quad z = -x $
  Ridicând la cub aceste relații, obținem condiția echivalentă în variabilele originale:
  $ a = -b quad "sau" quad b = -c quad "sau" quad c = -a $
  Sau, compact:
  $ (a + b)(b + c)(c + a) = 0 $

  *Pasul 2: Analiza celei de-a doua egalități*
  Considerăm relația:
  $ (a + b + c)^3 = a^3 + b^3 + c^3 $
  
  Aplicăm aceeași identitate algebrică (direct pentru $a, b, c$):
  $ cancel(a^3 + b^3 + c^3) + 3(a + b)(b + c)(c + a) = cancel(a^3 + b^3 + c^3) $
  
  Reducând termenii asemenea, obținem:
  $ 3(a + b)(b + c)(c + a) = 0 $
  
  Aceasta este exact aceeași condiție ca la Pasul 1:
  $ (a + b)(b + c)(c + a) = 0 $

  *Concluzie*
  Deoarece ambele egalități sunt echivalente cu condiția ca suma a două dintre numere să fie zero ($a+b=0$ sau $b+c=0$ sau $c+a=0$), rezultă că cele două afirmații sunt echivalente între ele.
]

// ============================================================================
// PROBLEMA 25242
// ============================================================================
#problem(25242)[
  Fie $A B C$ un triunghi si $M$ un punct interior lui. Arătați că
  $ arrow(M A) dot S_(M B C) + arrow(M B) dot S_(M C A) + arrow(M C) dot S_(M A B) = 0 $
]

#proof[
  Pentru simplificarea scrierii, notăm ariile triunghiurilor formate de punctul $M$ cu vârfurile triunghiului astfel:
  $ S_a = S_(M B C), quad S_b = S_(M C A), quad S_c = S_(M A B) $

  Fie $A'$ punctul de intersecție al dreptei $A M$ cu latura $B C$.
  Punctul $M$ se află în interiorul segmentului $A A'$, iar $A'$ se află pe segmentul $B C$.

  *Pasul 1: Exprimarea vectorului $arrow(M A')$*
  Deoarece $A'$ aparține segmentului $B C$, vectorul $arrow(M A')$ se poate descompune după vectorii $arrow(M B)$ și $arrow(M C)$. Conform teoremei ariilor (sau a raportului în care o ceviană împarte latura opusă), raportul segmentelor este inversul raportului ariilor adiacente:
  $ (B A') / (A' C) = S_(A B A') / S_(A C A') = S_(M B A') / S_(M C A') = (S_(A B A') - S_(M B A')) / (S_(A C A') - S_(M C A')) = S_c / S_b $
  
  Astfel, vectorul de poziție al punctului $A'$ (având originea în $M$) este media ponderată:
  $ arrow(M A') = (S_b arrow(M B) + S_c arrow(M C)) / (S_b + S_c) $

  *Pasul 2: Relația dintre $arrow(M A)$ și $arrow(M A')$*
  Vectorii $arrow(M A)$ și $arrow(M A')$ sunt coliniari și au sensuri opuse. Raportul modulelor lor este dat de raportul ariilor "superioare" vs "inferioare" (Teorema lui Van Aubel pentru arii):
  $ (M A) / (M A') = (S_b + S_c) / S_a $
  
  Scriind vectorial (cu semnul minus pentru sens opus):
  $ arrow(M A) = - (S_b + S_c) / S_a dot arrow(M A') $

  *Pasul 3: Substituția și finalizarea*
  Înlocuim expresia lui $arrow(M A')$ din Pasul 1 în relația de la Pasul 2:
  $ arrow(M A) = - (S_b + S_c) / S_a dot (S_b arrow(M B) + S_c arrow(M C)) / (S_b + S_c) $
  
  Termenul $(S_b + S_c)$ se simplifică:
  $ arrow(M A) = - 1 / S_a (S_b arrow(M B) + S_c arrow(M C)) $
  
  Înmulțind cu $S_a$ și trecând toți termenii în partea stângă:
  $ S_a arrow(M A) = - S_b arrow(M B) - S_c arrow(M C) $
  $ S_a arrow(M A) + S_b arrow(M B) + S_c arrow(M C) = 0 $

  Revenind la notațiile inițiale, obținem exact identitatea cerută:
  $ arrow(M A) dot S_(M B C) + arrow(M B) dot S_(M C A) + arrow(M C) dot S_(M A B) = 0 $
]

// ============================================================================
// PROBLEMA 25243
// ============================================================================
#problem(25243)[
  Considerăm patru puncte în plan cu proprietatea că distanța dintre oricare două diferite este în intervalul $[2025, 2025sqrt(2)]$. Arătați că cele patru puncte determină un pătrat.
]

#proof[
  Notăm $L = 2025$. Condiția din enunț este că pentru oricare două puncte $X, Y$ din mulțime, avem:
  $ L <= d(X, Y) <= L sqrt(2) $

  Fie cele patru puncte $A, B, C, D$.

  *Pasul 1: Punctele formează un patrulater convex*
  Presupunem prin reducere la absurd că înfășurătoarea convexă nu este un patrulater. Atunci un punct (să zicem $D$) se află în interiorul triunghiului format de celelalte trei ($A B C$).
  
  Suma unghiurilor în jurul lui $D$ este $360 degree$. Prin urmare, cel puțin un unghi, să zicem $angle A D B$, este cel puțin $120 degree$.
  Aplicăm Teorema Cosinusului în $triangle A D B$:
  $ A B^2 = A D^2 + B D^2 - 2 A D dot B D dot cos(angle A D B) $
  Deoarece $angle A D B >= 120 degree$, avem $cos(angle A D B) <= -1/2$.
  $ A B^2 >= A D^2 + B D^2 + A D dot B D $
  
  Știm că distanțele $A D >= L$ și $B D >= L$. Rezultă:
  $ A B^2 >= L^2 + L^2 + L^2 = 3 L^2 $
  $ A B >= L sqrt(3) $
  
  Dar $sqrt(3) approx 1.73 > 1.41 approx sqrt(2)$, deci $A B > L sqrt(2)$, ceea ce contrazice ipoteza problemei.
  Concluzie: Punctele formează un patrulater convex $A B C D$.

  *Pasul 2: Toate unghiurile sunt de $90 degree$*
  Într-un patrulater convex, suma unghiurilor este $360 degree$.
  1.  Dacă ar exista un unghi obtuz (ex. $angle A B C > 90 degree$), atunci $cos(angle A B C) < 0$.
      $ A C^2 = A B^2 + B C^2 - 2 A B dot B C dot cos(angle A B C) > A B^2 + B C^2 $
      Cum $A B, B C >= L$, ar rezulta $A C^2 > 2 L^2$, deci $A C > L sqrt(2)$, contradicție.
      Deci, *toate unghiurile trebuie să fie $<= 90 degree$*.
  2.  Deoarece suma lor este $360 degree$ și niciunul nu poate depăși $90 degree$, rezultă obligatoriu că:
      $ angle A = angle B = angle C = angle D = 90 degree $
  Deci $A B C D$ este un dreptunghi.

  *Pasul 3: Laturile sunt egale*
  Într-un dreptunghi, diagonala $A C$ satisface Pitagora:
  $ A C^2 = A B^2 + B C^2 $
  
  Știm următoarele:
  -   $A B >= L$ și $B C >= L$ (din ipoteză).
  -   $A C <= L sqrt(2)$ (din ipoteză) $==> A C^2 <= 2 L^2$.
  
  Înlocuind în relația lui Pitagora:
  $ A B^2 + B C^2 <= 2 L^2 $
  
  Deoarece $A B^2 >= L^2$ și $B C^2 >= L^2$, suma lor este minim $2 L^2$.
  Pentru ca inegalitatea $A B^2 + B C^2 <= 2 L^2$ să aibă loc, singura posibilitate este cazul de egalitate:
  $ A B^2 = L^2 " și " B C^2 = L^2 $
  $ A B = L, quad B C = L $

  *Concluzie*
  Patrulaterul este un dreptunghi cu laturi egale (romb), deci este un pătrat cu latura $L$ și diagonala $L sqrt(2)$.
]

// ============================================================================
// PROBLEMA 25244
// ============================================================================
#problem(25244)[
  $a)$ Arătați că nu există o progresie aritmetică neconstantă de numere naturale cu toți termenii pătrate perfecte.\
  $b)$ Arătați că există progresii aritmetice neconstante de numere naturale care au o infinitate de termeni pătrate perfecte.
]

#proof[
  *Punctul a)*
  Vom demonstra prin reducere la absurd.
  Presupunem că există o progresie aritmetică $(a_n)_(n>=1)$ cu rația $r > 0$ (neconstantă), astfel încât fiecare termen este pătrat perfect.
  Deci, pentru orice $n$, există un număr natural $x_n$ astfel încât:
  $ a_n = x_n^2 $

  Deoarece rația $r$ este pozitivă, șirul $a_n$ este strict crescător, ceea ce implică faptul că și șirul bazelor $x_n$ este strict crescător ($x_(n+1) > x_n$).
  Fiind numere naturale, rezultă că diferența minimă dintre doi termeni consecutivi $x$ este 1:
  $ x_(n+1) >= x_n + 1 $

  Scriem relația de recurență a progresiei aritmetice pentru termenii $n$ și $n+1$:
  $ a_(n+1) - a_n = r $
  $ x_(n+1)^2 - x_n^2 = r $

  Dar diferența dintre două pătrate consecutive crește odată cu numerele. Putem estima limita inferioară a acestei diferențe:
  $ x_(n+1)^2 - x_n^2 >= (x_n + 1)^2 - x_n^2 $
  $ x_(n+1)^2 - x_n^2 >= x_n^2 + 2x_n + 1 - x_n^2 $
  $ x_(n+1)^2 - x_n^2 >= 2x_n + 1 $

  Combinând cu egalitatea cu rația $r$:
  $ r >= 2x_n + 1 $
  
  Această inegalitate trebuie să fie adevărată pentru orice $n$. Însă, deoarece progresia este infinită și crescătoare, $a_n -> oo$, deci și $x_n = sqrt(a_n) -> oo$.
  Acest lucru duce la o contradicție: $r$ este o constantă finită, în timp ce $2x_n + 1$ poate deveni oricât de mare.
  
  *Concluzie:* Nu există o astfel de progresie cu toți termenii pătrate perfecte.
  
  *Punctul b)*
  Trebuie să construim un exemplu de progresie aritmetică ce conține o infinitate de pătrate perfecte (dar nu neapărat consecutive).
  
  Considerăm progresia aritmetică dată de formula:
  $ a_n = 4n + 1, quad n >= 1 $
  Termenii sunt: $5, 9, 13, 17, 21, 25, ...$ (rația este $r=4$).

  Vom arăta că pătratul oricărui număr impar aparține acestei progresii.
  Fie $k$ un număr natural și $x = 2k + 1$ un număr impar.
  Calculăm pătratul său:
  $ x^2 = (2k + 1)^2 = 4k^2 + 4k + 1 = 4(k^2 + k) + 1 $
  
  Notăm $m = k^2 + k$. Evident $m$ este un număr natural.
  Astfel, $x^2 = 4m + 1$, ceea ce înseamnă că $x^2$ este termenul $a_m$ al progresiei noastre.
  
  Deoarece există o infinitate de numere impare, există o infinitate de pătrate perfecte în progresia $4n + 1$ (exemple: $9, 25, 49, 81, ...$).
]

// ============================================================================
// PROBLEMA 25245
// ============================================================================
#problem(25245)[
  $a)$ Arătați că
  $ x/(y^2) + y/(x^2) >= 1/x + 1/y $
  pentru orice $x, y > 0$.
  $b)$ Fie $a, b, c$ numere reale pozitive. Arătați că
  $ (b+c)/(a^2) + (c+a)/(b^2) + (a+b)/(c^2) >= 2(1/a + 1/b + 1/c) $
]

#proof[
  $a)$ Vom demonstra inegalitatea prin calcul direct și factorizare.
  Inegalitatea dată este echivalentă cu:
  $ x/(y^2) + y/(x^2) - 1/x - 1/y >= 0 $

  Aducem la același numitor comun $x^2 y^2$:
  $ (x^3 + y^3 - x y^2 - y x^2)/(x^2 y^2) >= 0 $

  Grupăm termenii de la numărător pentru a factoriza:
  $ (x^2(x - y) - y^2(x - y))/(x^2 y^2) >= 0 $
  $ ((x - y)(x^2 - y^2))/(x^2 y^2) >= 0 $
  
  Descompunem diferența de pătrate $x^2 - y^2 = (x-y)(x+y)$:
  $ ((x - y)(x - y)(x + y))/(x^2 y^2) >= 0 $
  $ ((x - y)^2 (x + y))/(x^2 y^2) >= 0 $

  Analizăm semnul expresiei obținute:
  - $(x - y)^2 >= 0$ pentru orice numere reale (pătrat perfect).
  - Deoarece $x, y > 0$, avem $x + y > 0$ și numitorul $x^2 y^2 > 0$.
  
  Prin urmare, fracția este produsul unor termeni pozitivi sau nuli, deci inegalitatea este adevărată.

  $b)$ Desfacem parantezele din membrul stâng ($L H S$) și grupăm termenii convenabil pentru a utiliza rezultatul demonstrat la punctul $a)$.
  
  $ L H S = b/(a^2) + c/(a^2) + c/(b^2) + a/(b^2) + a/(c^2) + b/(c^2) $
  
  Regrupăm termenii în perechi "mixte":
  $ L H S = (b/(a^2) + a/(b^2)) + (c/(b^2) + b/(c^2)) + (a/(c^2) + c/(a^2)) $
  
  Aplicăm inegalitatea de la punctul $a)$ ($x/(y^2) + y/(x^2) >= 1/x + 1/y$) pentru fiecare paranteză:
  
  1. Pentru perechea $(a, b)$: 
     $ b/(a^2) + a/(b^2) >= 1/a + 1/b $
  
  2. Pentru perechea $(b, c)$: 
     $ c/(b^2) + b/(c^2) >= 1/b + 1/c $
     
  3. Pentru perechea $(c, a)$: 
     $ a/(c^2) + c/(a^2) >= 1/c + 1/a $
     
  Însumând aceste trei inegalități, obținem:
  $ L H S >= (1/a + 1/b) + (1/b + 1/c) + (1/c + 1/a) $
  
  Grupând termenii asemenea din membrul drept:
  $ L H S >= 2/a + 2/b + 2/c $
  $ (b+c)/(a^2) + (c+a)/(b^2) + (a+b)/(c^2) >= 2(1/a + 1/b + 1/c) $
]

// ============================================================================
// PROBLEMA 25246
// ============================================================================
#problem(25246)[
  Pentru fiecare $n in NN^*$, notăm $lr(I_n = [(n+1)/n, (13n-2)/(n+1)])$.\
  $a)$ Determinați $m in NN^*$ astfel încât mulțimea $I_m inter ZZ$ să aibă $10$ elemente.\
  $b)$ Arătați că $I_n subset I_(n+1)$, pentru orice $n in NN^*$.
]

#proof[
  Pentru a simplifica calculele, vom prelucra expresiile capetelor intervalului $I_n = [a_n, b_n]$.
  $ a_n = (n+1)/n = 1 + 1/n $
  $ b_n = (13n-2)/(n+1) = (13(n+1) - 15)/(n+1) = 13 - 15/(n+1) $
  Deci $I_n = [1 + 1/n, 13 - 15/(n+1)]$.

  $a)$ Căutăm $m in NN^*$ pentru care mulțimea $M = I_m inter ZZ$ are cardinalul 10.
  
  Analizăm capătul din stânga, $a_m = 1 + 1/m$:
  - Dacă $m=1$, $I_1 = [2, 5.5]$, deci $M={2,3,4,5}$ (4 elemente). Nu convine.
  - Pentru orice $m >= 2$, avem $0 < 1/m < 1$, deci $1 < a_m < 2$.
  
  Astfel, pentru $m >= 2$, cel mai mic număr întreg din interval este $2$.
  Pentru ca mulțimea să aibă exact $10$ elemente consecutive începând cu $2$, aceasta trebuie să fie $M = {2, 3, ..., 11}$.
  
  Aceasta impune condiția ca $11$ să fie în interval, iar $12$ să fie în afara lui:
  $ 11 <= b_m < 12 $
  
  Înlocuim expresia lui $b_m$:
  $ 11 <= 13 - 15/(m+1) < 12 $
  
  Scădem $13$ din toți termenii:
  $ -2 <= -15/(m+1) < -1 $
  
  Înmulțim cu $-1$ (schimbând sensul inegalităților):
  $ 1 < 15/(m+1) <= 2 $
  
  Rezolvăm inegalitățile separat:
  1. $15/(m+1) > 1 => m+1 < 15 => m < 14$
  2. $15/(m+1) <= 2 => 15 <= 2m + 2 => 13 <= 2m => m >= 6.5$
  
  Cum $m$ este număr natural, valorile posibile sunt:
  $ m in {7, 8, 9, 10, 11, 12, 13} $

  $b)$ Pentru a arăta că $I_n subset I_(n+1)$, trebuie să demonstrăm că intervalul $I_(n+1)$ îl include pe $I_n$. Asta înseamnă:
  $ a_(n+1) <= a_n " și " b_(n+1) >= b_n $
  
  1. Comparăm capetele din stânga:
  $ a_(n+1) - a_n = (1 + 1/(n+1)) - (1 + 1/n) = 1/(n+1) - 1/n $
  $ a_(n+1) - a_n = (n - (n+1))/(n(n+1)) = -1/(n(n+1)) < 0 $
  Deci $a_(n+1) < a_n$.
  
  2. Comparăm capetele din dreapta:
  $ b_(n+1) - b_n = (13 - 15/(n+2)) - (13 - 15/(n+1)) $
  $ b_(n+1) - b_n = 15/(n+1) - 15/(n+2) = (15(n+2) - 15(n+1))/((n+1)(n+2)) $
  $ b_(n+1) - b_n = 15/((n+1)(n+2)) > 0 $
  Deci $b_(n+1) > b_n$.
  
  Deoarece limita inferioară scade și limita superioară crește odată cu $n$, avem incluziunea:
  $ [a_n, b_n] subset [a_(n+1), b_(n+1)] $
]

// ============================================================================
// PROBLEMA 25247
// ============================================================================
#problem(25247)[
  Arătați că, pentru orice numere reale $x$ și $y$, au loc inegalitațile:\
  $a) space abs(x-y) + abs(x+y) <= 2sqrt(x^2+y^2)$\
  $b) space abs(x+y)/(1+abs(x+y)) <= abs(x)/(1+abs(x)) + abs(y)/(1+abs(y))$
]

#proof[
  $a)$ Deoarece ambii membri ai inegalității sunt nenegativi (sumă de module și radical), putem ridica relația la pătrat fără a schimba sensul inegalității.
  
  Inegalitatea de demonstrat este echivalentă cu:
  $ (abs(x-y) + abs(x+y))^2 <= (2sqrt(x^2+y^2))^2 $
  
  Expandăm membrul stâng folosind formula $(a+b)^2 = a^2 + b^2 + 2a b$:
  $ abs(x-y)^2 + abs(x+y)^2 + 2abs(x-y) dot abs(x+y) <= 4(x^2+y^2) $
  
  Știm că $abs(a)^2 = a^2$, deci:
  $ (x-y)^2 + (x+y)^2 + 2abs((x-y)(x+y)) <= 4(x^2+y^2) $
  
  Calculăm pătratele și simplificăm:
  $ (x^2 - 2x y + y^2) + (x^2 + 2x y + y^2) + 2abs(x^2 - y^2) <= 4(x^2+y^2) $
  $ 2(x^2 + y^2) + 2abs(x^2 - y^2) <= 4(x^2+y^2) $
  
  Scădem termenul $2(x^2 + y^2)$ din ambele părți:
  $ 2abs(x^2 - y^2) <= 2(x^2+y^2) $
  
  Împărțim prin $2$:
  $ abs(x^2 - y^2) <= x^2 + y^2 $
  
  Această ultimă relație este adevărată conform inegalității triunghiului pentru module ($abs(a-b) <= abs(a) + abs(b)$):
  $ abs(x^2 - y^2) <= abs(x^2) + abs(-y^2) = x^2 + y^2 $
  Inegalitatea este demonstrată.

  $b)$ Vom demonstra folosind monotonia funcției auxiliare.
  Fie funcția $f: [0, infinity) -> RR$, $f(t) = t/(1+t)$.
  Putem scrie $f(t) = (t+1-1)/(t+1) = 1 - 1/(1+t)$.
  Deoarece $1/(1+t)$ scade când $t$ crește, rezultă că $f(t)$ este o funcție *crescătoare*.
  
  Știm din inegalitatea triunghiului că:
  $ abs(x+y) <= abs(x) + abs(y) $
  
  Aplicând funcția crescătoare $f$ peste această inegalitate, obținem:
  $ f(abs(x+y)) <= f(abs(x) + abs(y)) $
  
  Explicităm membrul drept:
  $ ( abs(x+y) )/( 1+abs(x+y) ) <= ( abs(x) + abs(y) )/( 1 + abs(x) + abs(y) ) $
  
  Descompunem fracția din dreapta în sumă de două fracții:
  $ ( abs(x) + abs(y) )/( 1 + abs(x) + abs(y) ) = abs(x)/( 1 + abs(x) + abs(y) ) + abs(y)/( 1 + abs(x) + abs(y) ) $
  
  Micșorând numitorul unei fracții pozitive, valoarea fracției crește. Așadar:
  1. $ abs(x)/( 1 + abs(x) + abs(y) ) <= abs(x)/( 1 + abs(x) ) $ (am eliminat $abs(y)$ de la numitor)
  2. $ abs(y)/( 1 + abs(x) + abs(y) ) <= abs(y)/( 1 + abs(y) ) $ (am eliminat $abs(x)$ de la numitor)
  
  Prin urmare:
  $ ( abs(x+y) )/( 1+abs(x+y) ) <= abs(x)/( 1 + abs(x) ) + abs(y)/( 1 + abs(y) ) $
]

// ============================================================================
// PROBLEMA 25248
// ============================================================================
#problem(25248)[
  Arătați că, pentru orice $x in RR$ au loc afirmațiile:\
  $a) space floor(-x) = cases(-floor(x) ", " quad quad "dacă" x in ZZ, -floor(x)-1 ","quad"dacă" x in RR without ZZ)space;$\

  $b) space {-x} = cases(0 ", " quad quad quad "dacă" x in ZZ, 1-{x} ","quad"dacă" x in RR without ZZ)space;$\

  unde $floor(x)$ reprezintă partea întreagă și ${x}$ partea fracționară a numărului real $x$.
]

#proof[
  Vom folosi definiția părții întregi: pentru orice $x in RR$, $floor(x) = k$ dacă și numai dacă $k <= x < k+1$, unde $k in ZZ$.

  $a)$ Fie $k = floor(x)$. Analizăm cele două cazuri:

  *Cazul 1: $x$ este număr întreg ($x in ZZ$).*
  Dacă $x in ZZ$, atunci $x = k$.
  Rezultă că $-x = -k$, care este tot un număr întreg.
  Prin urmare:
  $ floor(-x) = floor(-k) = -k = -floor(x) $
  Relația este verificată.

  *Cazul 2: $x$ nu este număr întreg ($x in RR without ZZ$).*
  Deoarece $x$ nu este întreg, avem inegalități stricte:
  $ k < x < k+1 $
  
  Înmulțim inegalitatea cu $-1$ (se schimbă sensul inegalităților):
  $ -k > -x > -(k+1) $
  
  Rescriem ordinea termenilor:
  $ -k - 1 < -x < -k $
  
  Aceasta înseamnă că partea întreagă a lui $-x$ este cel mai mare întreg mai mic sau egal cu $-x$. Din inegalitatea de mai sus, acesta este $-k-1$.
  $ floor(-x) = -k - 1 $
  
  Înlocuind $k = floor(x)$, obținem:
  $ floor(-x) = -floor(x) - 1 $
  
  Ambele cazuri din enunț au fost demonstrate.

  $b)$ Folosim relația de definiție a părții fracționare: ${t} = t - floor(t)$.
  Calculăm ${-x} = -x - floor(-x)$ folosind rezultatele de la punctul $a)$.

  *Cazul 1: $x in ZZ$.*
  Din punctul $a)$, știm că $floor(-x) = -x$.
  $ {-x} = -x - (-x) = -x + x = 0 $

  *Cazul 2: $x in RR without ZZ$.*
  Din punctul $a)$, știm că $floor(-x) = -floor(x) - 1$.
  Înlocuim în formula părții fracționare:
  $ {-x} = -x - (-floor(x) - 1) $
  $ {-x} = -x + floor(x) + 1 $
  
  Regrupăm termenii pentru a evidenția ${x}$:
  $ {-x} = 1 - (x - floor(x)) $
  
  Deoarece $x - floor(x) = {x}$, rezultă:
  $ {-x} = 1 - {x} $

  În concluzie:
  $ {-x} = cases(0 ", " quad quad quad "dacă" x in ZZ, 1-{x} ","quad"dacă" x in RR without ZZ) $
]

// ============================================================================
// PROBLEMA 25249
// ============================================================================
#problem(25249)[
  Pe fiecare latură a unui poligon convex cu n laturi $(n>=3)$ se alege câte un punct și se duce din acest punct un vector perpendicular pe latură, îndreptat spre exteriorul poligonului și de lungime egală cu lungimea acestei laturi.\
  Arătați că suma tuturor acestori vectori este vectorul nul.
]

#proof[
  Fie $A_1, A_2, ..., A_n$ vârfurile poligonului parcurse în sens trigonometric (invers acelor de ceasornic).
  
  Notăm cu $arrow(l)_k$ vectorul asociat laturii $A_k A_(k+1)$ (cu convenția $A_(n+1) = A_1$).
  $ arrow(l)_k = arrow(A_k A_(k+1)) $
  
  Deoarece poligonul este o linie frântă închisă, suma vectorilor laturilor este vectorul nul:
  $ sum_(k=1)^n arrow(l)_k = arrow(0) $
  
  Fie $arrow(u)_k$ vectorul construit conform enunțului pe latura $arrow(l)_k$:
  1. Are lungimea egală cu latura: $|arrow(u)_k| = |arrow(l)_k|$.
  2. Este perpendicular pe latură: $arrow(u)_k perp arrow(l)_k$.
  3. Este orientat spre exterior.
  
  Geometric, vectorul $arrow(u)_k$ se obține rotind vectorul $arrow(l)_k$ cu $90 degree$ în sensul acelor de ceasornic (dată fiind parcurgerea trigonometrică a poligonului).
  
  Definim $cal(R)$ ca fiind transformarea de rotație cu $-90 degree$ în plan. Putem scrie:
  $ arrow(u)_k = cal(R)(arrow(l)_k) $
  
  Suma vectorilor ceruți este:
  $ S = sum_(k=1)^n arrow(u)_k = sum_(k=1)^n cal(R)(arrow(l)_k) $
  
  Deoarece rotația este o *transformare liniară* (rotația sumei este suma rotațiilor), putem scoate operatorul $cal(R)$ în factor:
  $ S = cal(R)( underbracket(sum_(k=1)^n arrow(l)_k, = arrow(0)) ) $
  
  Cum suma laturilor este nulă, obținem:
  $ S = cal(R)(arrow(0)) = arrow(0) $
  
  Astfel, suma vectorilor construiți este vectorul nul.
]

// ============================================================================
// PROBLEMA 25250
// ============================================================================
#problem(25250)[
  Fie $a_1, a_2, ..., a_n in NN^*$ distincte două câte două. Arătați că
  $ (a_1 a_2 ... a_n)/(a_1 + a_2 + ... + a_n) >= (1 dot 2 dot ... dot n)/(1 + 2 + ... + n) $
]

#proof[
  Fie $P = a_1 a_2 ... a_n$ produsul numerelor și $S = a_1 + a_2 + ... + a_n$ suma lor.
  Inegalitatea de demonstrat este $P/S >= n! / ( (n(n+1))/2 )$.
  
  Ordonăm numerele crescător: $x_1 < x_2 < ... < x_n$, unde ${x_1, ..., x_n} = {a_1, ..., a_n}$.
  Deoarece $a_i$ sunt numere naturale distincte nenule, avem relația:
  $ x_k >= k, space forall k in {1, ..., n} $
  
  Considerăm funcția $f: NN^* -> RR_+$, definită prin $f(t) = t / (M + t)$, unde $M > 0$ este o constantă.
  Derivata (sau simpla analiză a raportului) arată că $f(t) = 1 - M/(M+t)$ este o funcție strict crescătoare.
  
  Totuși, variabilele din problemă sunt cuplate (apar și la numărător și la numitor). Vom folosi o abordare bazată pe proprietatea de minim.
  
  Considerăm expresia $E(A) = (product_(x in A) x) / (sum_(x in A) x)$ pentru o mulțime $A$ de $n$ numere naturale distincte.
  Presupunem că mulțimea $A$ nu este ${1, 2, ..., n}$. Atunci există un element $u in A$ și un element $v in NN^* without A$ astfel încât $v < u$ (putem înlocui un element mare cu unul mai mic care lipsește).
  Fie $A' = (A without {u}) union {v}$.
  Notăm $P_0$ produsul elementelor comune și $S_0$ suma elementelor comune ($A inter A'$).
  
  Avem $E(A) = (P_0 dot u)/(S_0 + u)$ și $E(A') = (P_0 dot v)/(S_0 + v)$.\
  Comparăm cele două valori. Deoarece funcția $g(t) = (P_0 t)/(S_0 + t)$ este strict crescătoare (pentru $P_0, S_0 > 0$), și $u > v$, rezultă:
  $ (P_0 u)/(S_0 + u) > (P_0 v)/(S_0 + v) => E(A) > E(A') $
  
  Astfel, prin înlocuirea repetată a elementelor mai mari cu elementele mai mici disponibile, valoarea expresiei scade.
  Minimul se atinge atunci când mulțimea $A$ conține cele mai mici $n$ numere naturale distincte posibile, adică $A_{min} = {1, 2, ..., n}$.
  Prin urmare:
  $ (a_1 ... a_n)/(a_1 + ... + a_n) >= (1 dot ... dot n)/(1 + ... + n) $
]

// ============================================================================
// PROBLEMA 25251
// ============================================================================
#problem(25251)[
  Determinați numerele naturale nenule $n$ pentru care există $n$ numere naturale impare $a_1, a_2, ..., a_n$ astfel încât $a_1 a_2 ... a_n = a_1 + a_2 + ... + a_n$.
]

#proof[
  Fie $P = a_1 ... a_n$ și $S = a_1 + ... + a_n$.
  
  *Pasul 1: Analiza parității.*
  Deoarece toate numerele $a_i$ sunt impare, produsul lor $P$ este impar.
  Pentru ca egalitatea $P=S$ să aibă loc, suma $S$ trebuie să fie impară.
  Suma a $n$ numere impare are aceeași paritate cu $n$.
  Rezultă condiția necesară: *$n$ este impar*.
  
  *Pasul 2: Analiza modulo 4.*
  Orice număr impar $x$ este de forma $4k+1$ sau $4k+3$.
  Avem $x equiv 1 space (mod 4)$ sau $x equiv -1 space (mod 4)$.\
  Fie $k$ numărul de termeni congruenți cu $-1$ modulo 4.
  
  Produsul: $P equiv (-1)^k space (mod 4)$.
  Suma: $S equiv k(-1) + (n-k)(1) = n - 2k space (mod 4)$.
  
  Egalăm congruențele:
  $ (-1)^k equiv n - 2k space (mod 4) $
  
  Dacă $n equiv -1 mod 4$:
  $ (-1)^k equiv -1 - 2k space (mod 4) $
  - Dacă $k$ este par, $(-1)^k = 1$. Avem $1 equiv -1 - 2k => 2 + 2k equiv 0 => 2(1+k)$ divizibil cu 4. Cum $k$ par, $k+1$ impar, imposibil.
  - Dacă $k$ este impar, $(-1)^k = -1$. Avem $-1 equiv -1 - 2k => 2k$ divizibil cu 4. Cum $k$ impar, imposibil.
  
  Deci $n$ nu poate fi de forma $4m+3$. Rămâne doar posibilitatea *$n equiv 1 space (mod 4)$*.
  
  *Pasul 3: Construcția soluției pentru $n = 4m + 1$.*
  Încercăm o soluție cu $n-2$ termeni egali cu $1$ și doi termeni $x, y$.
  Ecuația devine:
  $ 1^(n-2) dot x dot y = (n-2) dot 1 + x + y $
  $ x y = n - 2 + x + y $
  $ x y - x - y + 1 = n - 1 $
  $ (x-1)(y-1) = n - 1 $
  
  Deoarece $n equiv 1 space (mod 4)$, $n-1$ este multiplu de 4. Putem scrie $n-1 = 4m$.
  Alegem factorii: $x-1 = 2$ și $y-1 = 2m$.
  Rezultă $x = 3$ și $y = 2m + 1$.
  Ambele sunt numere impare. Deoarece am folosit și $n-2$ de $1$ (care sunt impari), am găsit o configurație validă.
  
  *Concluzie:* Numerele căutate sunt de forma $n = 4k + 1$, cu $k in NN$.
]

// ============================================================================
// PROBLEMA 25252
// ============================================================================
#problem(25252)[
  Fie $a, b, c, d > 0$ astfel încât $a + b + c + d = 2$. Demonstrați că
  $ 1/(a+b) + 1/(a+c) + 1/(a+d) + 1/(b+c) + 1/(b+d) + 1/(c+d) >= 9/4 (1/(1+a) + 1/(1+b) + 1/(1+c) + 1/(1+d)) $
]

#proof[
  Notăm membrul stâng cu $L H S$. Observăm că suma din stânga conține toate perechile posibile de numitoare de forma $(x+y)$.
  Grupăm termenii din $L H S$ în funcție de variabila pe care o conțin. De exemplu, termenii care conțin $a$ sunt $1/(a+b), 1/(a+c), 1/(a+d)$.
  
  Vom demonstra mai întâi o inegalitate ajutătoare. Aplicăm inegalitatea mediilor (AM-HM) pentru acești 3 termeni:
  $ ((a+b) + (a+c) + (a+d)) / 3 >= 3/(1/(a+b) + 1/(a+c) + 1/(a+d)) $
  $ 1/(a+b) + 1/(a+c) + 1/(a+d) >= 9/((a+b) + (a+c) + (a+d)) $
  $ 1/(a+b) + 1/(a+c) + 1/(a+d) >= 9/(3a + b + c + d) $
  
  Folosim condiția din ipoteză $a+b+c+d=2$. Putem rescrie numitorul:
  $ 3a + b + c + d = 2a + (a+b+c+d) = 2a + 2 = 2(1+a) $
  
  Înlocuind în inegalitate, obținem:
  $ 1/(a+b) + 1/(a+c) + 1/(a+d) >= 9/(2(1+a)) space (1) $
  
  Putem scrie relații analoage pentru celelalte variabile $b, c, d$:
  $ 1/(b+a) + 1/(b+c) + 1/(b+d) >= 9/(2(1+b)) space (2) $
  $ 1/(c+a) + 1/(c+b) + 1/(c+d) >= 9/(2(1+c)) space (3) $
  $ 1/(d+a) + 1/(d+b) + 1/(d+c) >= 9/(2(1+d)) space (4) $
  
  Adunăm relațiile $(1), (2), (3)$ și $(4)$.
  Observăm că în suma membrilor stângi, fiecare fracție de tipul $1/(x+y)$ apare exact de două ori (o dată în inegalitatea pentru $x$ și o dată în cea pentru $y$).
  
  Astfel:
  $ 2 dot L H S >= 9/2 (1/(1+a) + 1/(1+b) + 1/(1+c) + 1/(1+d)) $
  
  Împărțim prin 2:
  $ L H S >= 9/4 sum_(c y c) 1/(1+a) $
  
  Ceea ce trebuia demonstrat. Egalitatea are loc dacă $a=b=c=d=1/2$.
]