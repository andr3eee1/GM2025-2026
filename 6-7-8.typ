#import "@local/my-math:0.1.0": *
#show sym.arrow.l.r.double: sym.arrow.l.r.double.long

#show: project.with(
  title: "Rezolvari gazeta matematica 6-7-8",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 29143
// ============================================================================
#problem(29143, author: "Florin Rotaru")[
  Determinați numerele naturale $n >= 3$ cu proprietatea că există un poligon convex cu $n$ laturi în care orice două unghiuri diferite au modulul diferenței măsurilor cel puțin egal cu $45degree.$
]

#proof[
  Nu putem avea unghiuri egale, deoarece diferența lor ar fi $0degree < 45degree$.
  Ordonăm unghiurile poligonului: $0degree < alpha_1 < alpha_2 < ... < alpha_n < 180degree$.

  Din condiția problemei, avem $alpha_(k+1) - alpha_k >= 45degree$, ceea ce implică:
  $ alpha_k >= alpha_1 + (k - 1) dot 45degree, quad forall k in {1, ..., n} $

  Pentru ultimul unghi ($n$), avem sistemul:
  $ cases(
    alpha_n >= alpha_1 + (n - 1) dot 45degree,
    alpha_n < 180degree
  ) $
  $ => alpha_1 + (n - 1) dot 45degree < 180degree $
  
  Deoarece $alpha_1 > 0$, rezultă strict:
  $ (n - 1) dot 45degree < 180degree quad | :45degree $
  $ n - 1 < 4 => n < 5 $

  Cum $n >= 3$, singurele soluții posibile sunt $n in {3, 4}$. Analizăm cazurile:

  - *Cazul $n = 3$:*
    Căutăm o progresie aritmetică cu rația $45degree$ și suma $180degree$.
    $ alpha_1 + (alpha_1 + 45degree) + (alpha_1 + 90degree) = 180degree $
    $ 3 alpha_1 + 135degree = 180degree => 3 alpha_1 = 45degree => alpha_1 = 15degree $
    Soluția este: $15degree, 60degree, 105degree$. Toate sunt $< 180degree$.
    $ => #rect[n=3] "este soluție." $

  - *Cazul $n = 4$:*
    Căutăm o progresie aritmetică cu rația $45degree$ și suma $360degree$.
    $ 4 alpha_1 + (45degree dot (4 dot 3)/2) = 360degree $
    $ 4 alpha_1 + 270degree = 360degree => 4 alpha_1 = 90degree => alpha_1 = 22.5degree $
    Soluția este: $22.5degree, 67.5degree, 112.5degree, 157.5degree$. Toate sunt $< 180degree$.
    $ => #rect[n=4] "este soluție." $
]

// ============================================================================
// PROBLEMA 29144
// ============================================================================
#problem(29144, author: "Mihaela Berindeanu")[
  În triunghiul ascuțitunghic neechilateral $A B C$ cu ortocentrul $H$ și centrul cercului circumscris $O$ are loc $O H parallel B C$. Arătați că $angle.spheric B A C > 60degree$.
]

#proof[
  #grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      Folosim relația lui Sylvester: $arrow(O H) = arrow(O A) + arrow(O B) + arrow(O C)$.
      
      Fie $M$ mijlocul laturii $B C$. Știm că $arrow(O B) + arrow(O C) = 2arrow(O M)$. Înlocuind în relația precedentă:
      $ arrow(O H) = arrow(O A) + 2arrow(O M) $

      Din ipoteză știm:
      1. $O$ este centrul cercului circumscris $=> O M perp B C$.
      2. $O H parallel B C$.
      
      Din (1) și (2) rezultă $O H perp O M$, deci produsul lor scalar este nul:
      $ arrow(O H) dot arrow(O M) = 0 $
    ],
    // Asigură-te că imaginea există la calea respectivă
    image("img/desen-29144.png", width: 6cm)
  )

  Înlocuim expresia vectorului $arrow(O H)$ în produsul scalar:
  $ (arrow(O A) + 2arrow(O M)) dot arrow(O M) = 0 $
  $ arrow(O A) dot arrow(O M) + 2 abs(arrow(O M))^2 = 0 $
  $ arrow(O A) dot arrow(O M) = -2 abs(arrow(O M))^2 $

  Trecem la module. Știm că $x <= abs(x)$, deci:
  $ 2 abs(arrow(O M))^2 = abs(-2 abs(arrow(O M))^2) = abs(arrow(O A) dot arrow(O M)) $
  
  Aplicăm inegalitatea Cauchy-Schwarz (sau definiția produsului scalar):
  $ abs(arrow(O A) dot arrow(O M)) <= abs(arrow(O A)) dot abs(arrow(O M)) $

  Combinând relațiile:
  $ 2 abs(arrow(O M))^cancel(2) <= abs(arrow(O A)) dot cancel(abs(arrow(O M))) $
  $ 2 abs(arrow(O M)) <= abs(arrow(O A)) $
  
  În triunghiul $O M C$ dreptunghic în $M$, avem $abs(arrow(O M)) = R cos A$, iar $abs(arrow(O A)) = R$.
  $ 2 R cos A <= R quad |:R $
  $ cos A <= 1/2 $

  Deoarece funcția cosinus este descrescătoare pe $(0, pi/2)$:
  $ A >= 60degree $

  *Tratarea egalității:*
  Dacă $A = 60degree$, ar însemna egalitate în Cauchy-Schwarz, adică vectorii $arrow(O A)$ și $arrow(O M)$ ar fi coliniari.
  Acest lucru implică $A, O, M$ coliniare $=>$ înălțimea din $A$ este și mediană $=> triangle A B C$ isoscel cu un unghi de $60degree => A B C$ echilateral.
  Dar ipoteza spune că triunghiul este *neechilateral*.
  
  $ => A != 60degree => #rect[angle A > 60degree] $
]

// ============================================================================
// PROBLEMA 29145
// ============================================================================
#problem(29145, author: "Gheorghe Crăciun")[
  Fie $a, b, c > 0$ cu $a + b + c = 3$. Arătați că:
  $ a^2 / (b^2 c) + b^2 / (c^2 a) + c^2 / (a^2 b) >= 1/3(a b^2 + b c^2 + c a^2)^2 $
] 

#proof[
  Notăm $L H S$ membrul stâng al inegalității.
  Aplicăm inegalitatea Cauchy-Buniakovski-Schwarz (forma Titu Andreescu sau cu fracții) pentru tripletele:
  1. $a/sqrt(b^2 c), space b/sqrt(c^2 a), space c/sqrt(a^2 b)$
  2. $sqrt(c), space sqrt(a), space sqrt(b)$

  Avem:
  $ (a^2/(b^2 c) + b^2/(c^2 a) + c^2/(a^2 b)) (c + a + b) >= ( a/(b cancel(sqrt(c))) cancel(sqrt(c)) + b/(c cancel(sqrt(a))) cancel(sqrt(a)) + c/(a cancel(sqrt(b))) cancel(sqrt(b)) )^2 $
  
  Folosind faptul că $a+b+c=3$, obținem:
  $ 3 dot L H S >= (a/b + b/c + c/a)^2 $
  $ L H S >= 1/3 (a/b + b/c + c/a)^2 $

  Pentru a demonstra inegalitatea din enunț, este suficient să arătăm că:
  $ 1/3 (a/b + b/c + c/a)^2 >= 1/3 (a b^2 + b c^2 + c a^2)^2 $
  $ a/b + b/c + c/a >= a b^2 + b c^2 + c a^2 $

  Amplificăm fracțiile pentru a aduce la numitor comun parțial sau observăm identitatea:
  $ (a^2 c + b^2 a + c^2 b) / (a b c) >= a b^2 + b c^2 + c a^2 $
  Dar o cale mai simplă este omogenizarea. Știm că $(a+b+c)^2 / (a b + b c + c a) >= 3$ (nu ajută direct).
  
  Să rescriem inegalitatea intermediară:
  $ a/b + b/c + c/a = (a^2 c + b^2 a + c^2 b) / (a b c) $
  Totuși, metoda "mixing variables" sau verificarea cazurilor particulare este mai eficientă aici.
  Inegalitatea este omogenă. Maximul expresiei $E(a,b,c) = (a b^2 + b c^2 + c a^2)$ cu constrângeri tinde să fie atins când variabilele sunt egale sau una tinde la 0.
  
  Vom folosi metoda sugerată: *fixăm două variabile egale*.
  Fie $b = a$ și $c = 3 - 2a$, cu $a in (0, 3/2)$.

  Verificăm inegalitatea transformată:
  $ 9 / (a b + b c + c a) >= a b^2 + b c^2 + c a^2 $
  $ (a b + b c + c a)(a b^2 + b c^2 + c a^2) <= 9 $

  Înlocuim $b=a, c=3-2a$:
  1. *Primul factor:*
     $ a^2 + a(3-2a) + a(3-2a) = a^2 + 6a - 4a^2 = 6a - 3a^2 = 3a(2-a) $
  2. *Al doilea factor:*
     $ a^3 + a(3-2a)^2 + (3-2a)a^2 = a^3 + a(9 - 12a + 4a^2) + 3a^2 - 2a^3 $
     $ = a^3 + 9a - 12a^2 + 4a^3 + 3a^2 - 2a^3 = 3a^3 - 9a^2 + 9a = 3a(a^2 - 3a + 3) $

  Produsul devine:
  $ P(a) = [3a(2-a)] dot [3a(a^2 - 3a + 3)] = 9a^2 (2-a)(a^2 - 3a + 3) $
  Vrem să arătăm că $P(a) <= 9$, adică:
  $ a^2 (2-a)(a^2 - 3a + 3) <= 1 $
  
  Fie $f(a) = -a^5 + 5a^4 - 9a^3 + 6a^2$.
  Calculăm derivata:
  $ f'(a) = -5a^4 + 20a^3 - 27a^2 + 12a $
  $ f'(a) = -a(5a^3 - 20a^2 + 27a - 12) $
  Observăm că $a=1$ este rădăcină ($5-20+27-12=0$).
  $ f'(a) = -a(a-1)(5a^2 - 15a + 12) $

  Analizăm factorul pătratic $5a^2 - 15a + 12$:
  $ Delta = 225 - 4 dot 5 dot 12 = 225 - 240 = -15 < 0 $
  Deci paranteza este mereu pozitivă.

  Semnul derivatei depinde doar de $-a(a-1)$:
  - Pentru $a in (0, 1) => f'(a) > 0$ (funcția crește).
  - Pentru $a > 1 => f'(a) < 0$ (funcția scade).
  
  Maximul global se atinge în $a = 1$.
  $ f(1) = 1^2 dot (2-1) dot (1 - 3 + 3) = 1 $
  Deci $P(a) <= 9$ este adevărată, cu egalitate pentru $a=b=c=1$.
]

// ============================================================================
// PROBLEMA 29146
// ============================================================================
#problem(29146, author: "Vasile Pop")[
  Fie $a in NN^*$ și șirul $(a_n)_(n >= 1)$ definit prin $a_1 = a$ și

   $quad quad a_(n+1)=cases(
      a_n/2 "," quad quad "dacă " a_n "este par",
      a_n-1 "," quad "dacă " a_n "este impar"
   )$\

   Determinați $m in NN^*$ pentru care $a_m = 1$.
]

#proof[
  Vom analiza evoluția șirului folosind reprezentarea în baza 2 a numărului $a$.
  Fie scrierea binară a lui $a$:
  $ a = (1 b_k b_{k-1} dots b_1 b_0)_2 $
  unde $b_i in {0, 1}$, iar cel mai semnificativ bit este 1 (deoarece $a in NN^*$).

  Definim două mărimi asociate numărului $a$:
  - $L$: numărul total de biți (lungimea reprezentării). $L = floor(log_2 a) + 1$.
  - $S$: numărul biților egali cu 1 (suma cifrelor binare).

  Analizăm efectul operațiilor din enunț asupra biților:
  + *Cazul $a_n$ par:* Ultimul bit ($b_0$) este 0.
    Operația $a_n arrow a_n / 2$ este echivalentă cu o deplasare la dreapta.
    $ (...10)_2 arrow (...1)_2 $
    Se elimină un bit de 0.
    $ arrow $ *Cost: 1 pas.*

  + *Cazul $a_n$ impar:* Ultimul bit ($b_0$) este 1.
    Operația $a_n arrow a_n - 1$ transformă ultimul bit din 1 în 0.
    $ (...11)_2 arrow (...10)_2 $
    Numărul rezultat este par, deci următorul termen al șirului va fi obținut obligatoriu prin împărțire la 2 (eliminarea zeroului format).
    Așadar, pentru a elimina un bit de 1, sunt necesare două tranziții: scăderea (1 devine 0) și împărțirea (0 este eliminat).
    $ arrow $ *Cost: 2 pași.*

  *Calculul indicelui $m$:*
  Condiția $a_m = 1$ înseamnă că șirul ajunge la valoarea $(1)_2$. Acest lucru presupune eliminarea tuturor biților din dreapta celui mai semnificativ bit (MSB).
  
  Numărul biților ce trebuie eliminați este $L - 1$ (toți, mai puțin primul).
  Dintre aceștia:
  - $S - 1$ biți sunt egali cu 1 (excludem MSB care este 1).
  - $(L - 1) - (S - 1) = L - S$ biți sunt egali cu 0.

  Numărul total de tranziții ($T$) efectuate până la oprire este:
  $ T = 1 dot underbrace((L - S), "biți de 0") + 2 dot underbrace((S - 1), "biți de 1") $
  $ T = L - S + 2S - 2 = L + S - 2 $

  Deoarece $a_1$ este termenul de start (pasul 0), indicele $m$ este numărul de tranziții plus 1:
  $ m = T + 1 = L + S - 1 $

  *Concluzie:*
  $ m = floor(log_2 a) + s(a) $
  unde $s(a)$ reprezintă numărul biților de 1 din scrierea binară a lui $a$.
]

// ============================================================================
// PROBLEMA 29147
// ============================================================================
#problem(29147, author: "Mihaela Berindeanu")[
  Fie $A B C D E F$ un hexagon inscriptibil în care diagonalele $A D, B E "și" C F$ sunt concurente. Arătați că\
  $ (A B + C D + E F)(1/(B C) + 1/(D E) + 1/(F A)) >= 9 $
]

#proof[
  NU INCA! (NU-MI PLACE GEOMETRIA)
]

// ============================================================================
// PROBLEMA 29148
// ============================================================================
#problem(29148, author: "Marius Burtea")[
  Fie șirul $(a_n)_(n>=1)$ cu termenul general $a_n = 2025 dot n + 2024, "pentru" n >= 1$. Spunem despre un termen al acestui șir că este special dacă acesta se scrie în baza 10 doar cu cifrele 2 și 9. Arătați că $a_1131$ este special și că șirul conține o infinitate de termeni speciali.
]

#proof[
  == 1. Verificarea termenului $a_1131$
  
  Calculăm valoarea termenului pentru $n = 1131$:
  $ a_1131 &= 2025 dot 1131 + 2024 \
           &= 2025 dot (1130 + 1) + 2024 \
           &= 2288250 + 2025 + 2024 \
           &= 2290275 + 2024 \
           &= 2292299 $
  
  Observăm cifrele numărului obținut:
  $ a_1131 = 2292299 $
  Toate cifrele acestui număr aparțin mulțimii ${2, 9}$. Prin urmare, $a_1131$ este un termen special.

  ---

  == 2. Demonstrarea infinității termenilor speciali

  Observăm că termenul general poate fi scris sub forma:
  $ a_n = 2025(n+1) - 1 $
  Aceasta implică congruența:
  $ a_n equiv -1 space (mod 2025) $
  
  Pentru a demonstra că există o infinitate de termeni speciali, este suficient să arătăm că există o infinitate de numere naturale $N$ formate doar cu cifrele 2 și 9 care satisfac relația $N equiv -1 space (mod 2025)$.
  
  Descompunem modulul în factori primi:
  $ 2025 = 25 dot 81 $
  
  Vom construi un șir de numere speciale prin concatenare. Fie $x_0 = a_1131 = 2292299$. Știm deja că $x_0$ este special și că:
  $ x_0 equiv -1 space (mod 2025) $
  
  Căutăm un număr $P$, format doar din cifrele 2 sau 9, astfel încât, prin prepunerea lui $P$ în fața lui $x_0$ de un număr arbitrar de ori, restul împărțirii la 2025 să nu se schimbe.
  
  Numărul $x_0$ are $k=7$ cifre. Dacă prepunem un număr $P$ în fața lui $x_0$, noul număr va fi $N = P dot 10^7 + x_0$. Pentru ca $N equiv x_0 equiv -1 space (mod 2025)$, trebuie ca:
  $ P dot 10^7 equiv 0 space (mod 2025) $
  
  Aceasta condiție este echivalentă cu sistemul:
  $ cases(
    P dot 10^7 equiv 0 space (mod 25),
    P dot 10^7 equiv 0 space (mod 81)
  ) $
  
  1. *Divizibilitatea cu 25:*
     Deoarece $10^7 = 2^7 dot 5^7$, este evident că $25 | 10^7$. Deci prima condiție este satisfăcută pentru orice număr întreg $P$.
  
  2. *Divizibilitatea cu 81:*
     Deoarece $c m m d c(10^7, 81) = 1$, condiția se reduce la $P equiv 0 space (mod 81)$.
     Căutăm un număr $P$ format doar din cifrele 2 și 9, divizibil cu 81.
     Considerăm numărul format din nouă cifre de 9:
     $ P = underbrace(99...9, "9 ori") = 10^9 - 1 $
     Suma cifrelor lui $P$ este $9 dot 9 = 81$, deci $P$ este divizibil cu 9. Mai mult:
     $ P = 9 dot underbrace(11...1, "9 ori") $
     Numărul $11...1$ (de 9 ori) are suma cifrelor 9, deci este divizibil cu 9.
     Rezultă că $P$ este divizibil cu $9 dot 9 = 81$.
  
  *Construcția șirului infinit:*
  Definim șirul $(y_k)_(k>=0)$ astfel:
  - $y_0 = 2292299$
  - $y_k$ se obține prin concatenarea blocului $P = 999999999$ la stânga lui $y_(k-1)$.
  
  Matematic:
  $ y_k = P dot 10^(7 + 9(k-1)) + y_(k-1) $
  
  Deoarece $P$ este divizibil cu 81 și $10^m$ (pentru $m >= 7$) este divizibil cu 25, rezultă că termenul adăugat $P dot 10^(...)$ este multiplu de $2025 (= 81 dot 25)$.
  Astfel:
  $ y_k equiv y_(k-1) equiv ... equiv y_0 equiv -1 space (mod 2025) $
  
  Deci, toți termenii $y_k$ sunt de forma $2025 dot n + 2024$. Cum $y_k$ sunt formați doar prin concatenarea de cifre 9 la un număr format din 2 și 9, toți termenii sunt speciali. Deoarece șirul $(y_k)$ este strict crescător, există o infinitate de termeni speciali.
]

// ============================================================================
// PROBLEMA 29149
// ============================================================================
#problem(29149, author: "Adrian Bud")[
  Determinați șirul $(a_n)_(n>=1)$ definit prin $a_1 = 1$ și
  $ sum_(k=1)^n k^2/(a_k a_(k+1) + 1) = (a_n + 1)/8, quad "pentru orice" n >= 1 $
]

#proof[
  Vom demonstra prin inducție matematică faptul că $a_n = 2n - 1$ pentru orice $n >= 1$.
  Fie propoziția $P(n): a_n = 2n - 1$.

  *Pasul 1: Verificarea (Cazul de bază)*
  Pentru $n=1$, din enunț știm că $a_1 = 1$.
  Verificăm formula propusă: $2(1) - 1 = 1$. Deci $P(1)$ este adevărată.

  Deoarece recurența pe care o vom deduce leagă trei termeni consecutivi, verificăm și $P(2)$.
  Scriem relația din enunț pentru $n=1$:
  $ 1^2 / (a_1 a_2 + 1) = (a_1 + 1)/8 => 1 / (1 dot a_2 + 1) = 2/8 => a_2 + 1 = 4 => a_2 = 3 $
  Verificăm formula propusă: $2(2) - 1 = 3$. Deci $P(2)$ este adevărată.

  *Pasul 2: Demonstrația (Pasul inductiv)*
  Presupunem că $P(i)$ este adevărată pentru orice $i <= k$ (unde $k >= 2$).
  În particular, presupunem adevărate:
  $ P(k-1): a_(k-1) = 2(k-1) - 1 = 2k - 3 $
  $ P(k): a_k = 2k - 1 $

  Vom demonstra că $P(k+1)$ este adevărată, adică $a_(k+1) = 2(k+1) - 1 = 2k + 1$.

  Considerăm termenul general al sumei din stânga, notat $t_k$:
  $ t_k = k^2 / (a_k a_(k+1) + 1) $
  Știm că termenul general este diferența a două sume parțiale consecutive ($t_k = S_k - S_(k-1)$). Folosind formula din dreapta egalității din enunț:
  $ S_k - S_(k-1) = (a_k + 1)/8 - (a_(k-1) + 1)/8 = (a_k - a_(k-1))/8 $

  Înlocuim $a_k$ și $a_(k-1)$ conform ipotezei de inducție:
  $ t_k = ((2k - 1) - (2k - 3))/8 = 2/8 = 1/4 $

  Acum egalăm expresia lui $t_k$ cu valoarea găsită $1/4$:
  $ k^2 / (a_k a_(k+1) + 1) = 1/4 $
  $ 4k^2 = a_k a_(k+1) + 1 $

  Înlocuim $a_k = 2k - 1$ (din ipoteză):
  $ 4k^2 - 1 = (2k - 1) a_(k+1) $

  Observăm că membrul stâng este o diferență de pătrate:
  $ (2k - 1)(2k + 1) = (2k - 1) a_(k+1) $

  Deoarece $k >= 1$, avem $2k - 1 != 0$, deci putem simplifica prin $(2k - 1)$:
  $ a_(k+1) = 2k + 1 $

  Am obținut exact relația din $P(k+1)$.
  Conform principiului inducției matematice, $a_n = 2n - 1$ pentru orice $n >= 1$.
]

// ============================================================================
// PROBLEMA 29150
// ============================================================================
#problem(29150, author: "Dan Popescu")[
  Determinați pentru cate numere $x in (0, 100)$, numărul $x floor(x) {x}$ este intreg.
]

#proof[
  Fie $x in (0, 100)$. Notăm $n = floor(x)$ partea întreagă și $alpha = {x}$ partea fracționară a numărului $x$.
  Știm că $x = n + alpha$, unde $n in \{0, 1, ..., 99\}$ (deoarece $x < 100$) și $alpha in [0, 1)$.
  
  Expresia din enunț devine:
  $ E(x) = x dot floor(x) dot {x} = (n + alpha) dot n dot alpha = n^2 alpha + n alpha^2 $
  
  Căutăm numărul valorilor $x$ pentru care $E(x) = k$, unde $k in ZZ$.
  Analizăm problema pe două cazuri, în funcție de valoarea lui $n$:

  + *Cazul $x in (0, 1)$ (adică $n = 0$)* \
    În acest caz, $floor(x) = 0$, deci $E(x) = x dot 0 dot {x} = 0$.
    Valoarea 0 este număr întreg, deci *orice* număr real $x in (0, 1)$ este soluție.
    Rezultă o infinitate de soluții în acest interval.

  + *Cazul $x in [1, 100)$ (adică $n in \{1, 2, ..., 99\}$)* \
    Pentru un $n$ fixat, considerăm funcția $f_n : [0, 1) -> RR$, definită prin:
    $ f_n\(alpha\) = n alpha^2 + n^2 alpha $
    Deoarece $n >= 1$, funcția $f_n$ este strict crescătoare pe $[0, 1)$ (fiind sumă de funcții strict crescătoare pentru $alpha >= 0$).
    
    Determinăm imaginea funcției (mulțimea valorilor pe care le poate lua expresia):
    $ f_n\(0\) = 0 $
    $ lim_(alpha -> 1) f_n\(alpha\) = n(1)^2 + n^2(1) = n + n^2 $
    Deoarece $alpha in [0, 1)$, valorile expresiei se află în intervalul $[0, n^2 + n)$.
    
    Pentru ca $E(x)$ să fie întreg, valoarea $k = f_n\(alpha\)$ trebuie să fie un număr întreg din acest interval.
    Valorile posibile pentru $k$ sunt:
    $ k in \{0, 1, 2, ..., n^2 + n - 1\} $
    Numărul acestor valori este $(n^2 + n - 1) - 0 + 1 = n^2 + n$.
    
    Datorită monotoniei stricte a funcției $f_n$, pentru fiecare valoare întreagă $k$ din codomeniu există un unic $alpha in [0, 1)$ (și implicit un unic $x$) care satisface ecuația. Astfel, pentru un $n$ fixat, avem exact $n^2 + n$ soluții.
    
    Numărul total de soluții pentru $x in [1, 100)$ se obține însumând soluțiile pentru fiecare $n$ posibil:
    $ N = sum_(n=1)^(99) (n^2 + n) = sum_(n=1)^(99) n(n+1) $
    
    Folosim formula cunoscută $sum_(i=1)^k i(i+1) = (k(k+1)(k+2))/3$. Pentru $k=99$:
    $ N = (99 dot 100 dot 101) / 3 = 33 dot 100 dot 101 = 3300 dot 101 = 333300 $

  *Concluzie:*
  Dacă problema admite soluții reale continue, există o infinitate de soluții în intervalul $(0,1)$.
  Dacă ne referim la numărul de soluții din intervalul $[1, 100)$, acesta este *333.300*.
]

// ============================================================================
// PROBLEMA 29151
// ============================================================================
#problem(29151, author: "Cristian Heuberger")[
  Determinați $a in NN$ cu propietatea că există $m in NN$ astfel încât ecuația $x^2 - y^2 = a^m$ nu are soluții în $NN times NN$
]

#proof[
  
]