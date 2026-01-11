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