#import "@local/my-math:0.1.0": *

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
      Notăm $angle.spheric A = alpha => m(arc(B C)) = 2alpha$\
      $m(angle.spheric B O C) = m(arc(B C)) = 2alpha$ și $O M$ e bisectoarea $angle.spheric B O C => m(angle.spheric B O M) = m(angle.spheric M O C) = alpha$\
      $=> B M = M C = O C sin alpha$\
      $=> cases(B M = M C = R sin alpha, M O = R cos alpha)$

      *Demontrăm că* $A H = 2O M$

      Fie $H prime in (A D)$ astfel încât $A H prime = 2O M$\
      Dar $A H prime parallel O M => arrow(A H prime) = 2arrow(O M) = arrow(O B) + arrow(O C)$
    ],
    image("img/desen-29144.png", width: 6cm)
  )

  Deci $arrow(r)_(H prime) - arrow(r)_A = arrow(r)_B + arrow(r)_C - 2arrow(r)_O$, adică $arrow(r)_(H prime) = arrow(r)_A + arrow(r)_B + arrow(r)_C - 2arrow(r)_O$

  Conform teoremei lui Sylvester, $arrow(r)_H = arrow(r)_A + arrow(r)_B + arrow(r)_C - 2arrow(r)_O => arrow(r)_(H prime) = arrow(r)_H => H prime = H$\
  Deci $#rect[$A H = 2O M$] => A H = 2R cos alpha$

  Dar $Delta A H O$ este dreptunghic în $H => A H < A O => 2R cos alpha < R => cos alpha < 1/2 = cos 60degree => #rect[$angle.spheric A > 60degree$]$
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
  $ cancel(a^2c + b^2a + c^2b) / (a b c) >= cancel(a b^2 + b c^2 + c a^2) $
  $ a b c <= 1 $
  Din medii avem ca $(a+b+c)/3 >= root(3, a b c) => root(3, a b c) <= 1 => a b c <= 1$
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
  Notăm $A B = a, B C = b, C D = c, D E = d, E F = e, F A = f$\
  Trebuie să demonstrăm că
  $ (a + c + e)(1/b + 1/d + 1/f) >=9 <=> (a + c + e)/3 >= 3/(1/b + 1/d + 1/f) $

  Din $m_a >= m_g => (a + c + e)/3 >= root(3, a c e)$ și din $m_h <= m_g => 3/(1/b + 1/d + 1/f) <= root(3, b d f)$\
  Deci este deajuns să demonstrăm că $root(3, a c e) >= root(3, b d f) <=> a c e >= b d f$

  Din teorema Sinusurilor:
  $ d/(sin A_1) = c/(sin A_2) = f/(sin C_1) = e/(sin C_2) = b/(sin E_1) = a/(sin E_2) = 2R $
  Adica
  $ a = 2R sin E_2, b = 2R sin E_1 $
  $ c = 2R sin A_2, d = 2R sin A_1 $
  $ e = 2R sin C_2, f = 2R sin C_1 $

  Aplicăm teorema lui Ceva trigonometrică în $Delta A C E, A D, E B "și" C F$ ceviene:
  $ (sin A_1)/(sin A_2) dot (sin C_1)/(sin C_2) dot (sin E_1)/(sin E_2) = 1 $
  $ (d/cancel(2R))/(c/cancel(2R)) dot (f/cancel(2R))/(e/cancel(2R)) dot (b/cancel(2R))/(a/cancel(2R)) = 1 $
  $ b d f = a c e => a c e >= b d f => (a + c + e)(1/b + 1/d + 1/f) >=9 $
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
  Fie ecuația $x^2 - y^2 = N$, unde $N = a^m$.
  Descompunem diferența de pătrate în factori:
  $ (x - y)(x + y) = N $
  
  Notăm cei doi factori cu $u$ și $v$:
  $ cases(x - y = u, x + y = v) $
  unde $u dot v = N$ și $u < v$ (pentru $y > 0$).
  
  Rezolvând sistemul pentru $x$ și $y$ prin adunarea și scăderea celor două ecuații, obținem:
  $ 2x = u + v -> x = (u + v) / 2 $
  $ 2y = v - u -> y = (v - u) / 2 $
  
  Pentru ca $x, y in NN$, este necesar și suficient ca $u + v$ și $v - u$ să fie numere pare.
  Observăm că diferența lor este pară:
  $ (v + u) - (v - u) = 2u $
  Deoarece suma a două numere are aceeași paritate cu diferența lor, condiția se reduce la faptul că $u$ și $v$ trebuie să aibă *aceeași paritate*.
  
  Analizăm paritatea produsului $N = u dot v$:
  + *Cazul 1:* Dacă $u, v$ sunt ambele impare, atunci $N$ este impar ($N equiv 1$ sau $3 space(mod 4)$). Suma și diferența lor vor fi pare. Ecuația are întotdeauna soluții.
  + *Cazul 2:* Dacă $u, v$ sunt ambele pare, fie $u = 2k$ și $v = 2p$. Atunci $N = 2k dot 2p = 4k p$, deci $N$ este divizibil cu 4 ($N equiv 0 space(mod 4)$). Și în acest caz sistemul are soluții.
  + *Cazul 3:* Dacă $u$ și $v$ au parități diferite, acest lucru contrazice condiția $x, y in NN$. Acest caz corespunde situației în care $N$ este par, dar nu este divizibil cu 4 (un factor par și unul impar).
  
  $ exists x, y in NN <=> N equiv 2 space(mod 4) $
  
  Problema cere să determinăm $a$ astfel încât să *existe* un $m$ pentru care ecuația nu are soluții. Așadar, căutăm $a$ astfel încât:
  $ exists m in NN, a^m equiv 2 space(mod 4) $
  
  Analizăm resturile posibile ale lui $a$ la împărțirea cu 4:
  - Dacă $a$ este impar ($a equiv 1, 3 space(mod 4)$), atunci $a^m$ este impar pentru orice $m >= 1$. Ecuația are mereu soluții.
  - Dacă $a$ este multiplu de 4 ($a equiv 0 space(mod 4)$), atunci $a^m$ este multiplu de 4 pentru orice $m >= 1$. Ecuația are mereu soluții.
  - Dacă $a$ este par, dar nu multiplu de 4 ($a equiv 2 space(mod 4)$):
    - Pentru $m = 1$, avem $a^1 = a equiv 2 space(mod 4)$.
    Conform analizei de mai sus, pentru $N = a$, ecuația nu admite soluții. Condiția de existență a lui $m$ este satisfăcută.
  
  *Observație:* Pentru $m >= 2$, $a^m = a^2 dot a^(m-2) = (4k+2)^2 dot (...) = M_4 dot (...) equiv 0 space(mod 4)$, deci ecuația ar avea soluții. Totuși, cerința este doar să existe *un* $m$, iar $m=1$ verifică.

  *Concluzie:*
  Numerele căutate sunt cele de forma $a = 4k + 2, k in NN$ (numerele pare, nedivizibile cu 4).
]

// ============================================================================
// PROBLEMA 29152
// ============================================================================
#problem(29152, author: "Sebastian Buliga, Tudor Taropa")[
  Fie triunghiul ascuțitunghic $A B C$ și $M, N, P$ mijloacele laturilor $A B, B C, "respectiv" A C$. Fie $I "și" O$ centrele cercurilor înscris, respectiv circumscris al triunghiului $A B C$, iar $J "și" Q$ centrele cercurilor înscris, respectiv circumscris al triunghiului $M N P$. Notăm cu ${K} = Q I inter O J$.\
  Arătați că triunghiurile $A B C "și" K I O$ au același centru de greutate.
]

#proof[
  INCA NU!
]

// ============================================================================
// PROBLEMA 29153
// ============================================================================
#problem(29153, author: "Cristian Heuberger")[
  Fie $u, v > 0$ și paralelogramul $A B C D$. Spunem că punctele $M in (A D)$ și $N in (B C)$ sunt conectate, dacă $u dot (B N)/(B C) - (M D)/(A D) = v$.

  a) Arătați că există puncte conectate dacă și numai dacă $u > v$. \
  b) Dacă $u > v$ și punctele $M$ și $N$ sunt conectate, arătați că segmentul $(M N)$ trece printr-un punct fix.
]

#proof[
  INCA NU!
]

// ============================================================================
// PROBLEMA 29154
// ============================================================================
#problem(29154, author: "David Anghel")[
  Avem $n$ copii și $n$ bomboane distincte, unde $n >= 3$. Fiecare copil își ordonează bomboanele după preferințe. În prima zi, copiii se așează în linie și primesc, pe rând, bomboana care le place cel mai mult, din cele rămase. A doua zi, ordinea lor se inversează, dar procesul rămâne același. Se constată că fiecare copil primește aceeași bomboană în ambele zile. Arătați că fiecare copil a primit bomboana preferată.
]

#proof[
  Fie $n$ numărul de copii și $B$ mulțimea bomboanelor, cu $abs(B) = n$.
  Notăm copiii cu $c_1, c_2, ..., c_n$, unde indicele reprezintă *poziția* copilului în linie în prima zi (deci $c_1$ este primul la rând, $c_2$ al doilea, etc.).
  
  Fie $b_k$ bomboana primită de copilul $c_k$. Deoarece fiecare copil primește o bomboană distinctă, mulțimea $\{b_1, b_2, ..., b_n\}$ este identică cu $B$.
  Notăm relația de preferință a copilului $c_k$ cu $succ_(c_k)$.

  *Analiza primei zile:*
  Ordinea de alegere este $c_1, c_2, ..., c_n$.
  În momentul în care îi vine rândul copilului $c_k$, copiii din fața sa ($c_1, ..., c_(k-1)$) au ales deja bomboanele $\{b_1, ..., b_(k-1)\}$.
  Mulțimea bomboanelor disponibile pentru $c_k$ este $A_k = \{b_k, b_(k+1), ..., b_n\}$.
  Deoarece copilul alege $b_k$ (cea mai bună opțiune disponibilă pentru el), rezultă:
  $ b_k succ_(c_k) b_j, quad forall j in \{k+1, ..., n\} $
  (1) Copilul de pe poziția $k$ preferă bomboana sa față de orice bomboană a celor care urmează după el în linie.

  *Analiza celei de-a doua zile:*
  Ordinea se inversează: $c_n, c_(n-1), ..., c_1$.
  Să analizăm momentul când îi vine rândul copilului $c_k$.
  Înaintea lui au ales copiii $c_n, c_(n-1), ..., c_(k+1)$.
  Conform ipotezei, fiecare copil primește *aceeași* bomboană ca în prima zi. Așadar, $c_n$ a luat $b_n$, $c_(n-1)$ a luat $b_(n-1)$, etc.
  Deci, mulțimea bomboanelor deja alese este $\{b_n, b_(n-1), ..., b_(k+1)\}$.
  Mulțimea bomboanelor disponibile pentru $c_k$ în a doua zi este $A'_k = \{b_1, b_2, ..., b_k\}$.
  Deoarece $c_k$ alege tot $b_k$, înseamnă că aceasta este cea mai bună opțiune din $A'_k$:
  $ b_k succ_(c_k) b_j, quad forall j in \{1, ..., k-1\} $
  (2) Copilul de pe poziția $k$ preferă bomboana sa față de orice bomboană a celor care au ales după el în ziua 2 (adică cei din fața lui în ziua 1).

  *Concluzie:*
  Pentru un copil oarecare $c_k$, combinând relațiile (1) și (2):
  - Din (1): $b_k$ este preferată tuturor bomboanelor $b_j$ cu $j > k$.
  - Din (2): $b_k$ este preferată tuturor bomboanelor $b_j$ cu $j < k$.

  Rezultă că $b_k succ_(c_k) b_j$ pentru orice $j != k$.
  Așadar, $b_k$ este bomboana preferată a copilului $c_k$ dintre toate bomboanele existente.
]

// ============================================================================
// PROBLEMA 29155
// ============================================================================
#problem(29155, author: "George Stoica")[
  Un număr de bile distincte sunt distribuite în $n >= 2$ cutii, astfel încât în fiecare cutie să fie cel puțin o bilă. Apoi, se adaugă o nouă cutie și se redistribuie bilele astfel încât în fiecare dintre cele $n + 1$ cutii să fie cel puțin o bilă. Arătați că există două bile, fiecare cu proprietatea că noua cutie în care se află are mai puține bile decât cutia în care se afla inițial.
]

#proof[
  Vom utiliza o metodă bazată pe o funcție potențial ("sum of inverse sizes").
  Fie $cal(B)$ mulțimea bilelor. Pentru fiecare bilă $b in cal(B)$, notăm cu $abs(C(b))$ numărul de bile din cutia în care se află bila $b$.

  Definim suma $S$ astfel:
  $ S = sum_(b in cal(B)) 1 / abs(C(b)) $

  Să calculăm această sumă grupând termenii pe cutii. Dacă avem cutiile $C_1, ..., C_k$ cu numărul de bile $x_1, ..., x_k$ (unde $x_j >= 1$), atunci contribuția cutiei $j$ la sumă este:
  $ sum_(b in C_j) 1 / abs(C(b)) = sum_(b in C_j) 1 / x_j = x_j dot 1 / x_j = 1 $
  Astfel, $S$ este egală cu numărul total de cutii.

  *Configurația inițială (A):*
  Avem $n$ cutii.
  $ S_A = sum_(b in cal(B)) 1 / abs(C_A (b)) = n $

  *Configurația finală (B):*
  Avem $n + 1$ cutii.
  $ S_B = sum_(b in cal(B)) 1 / abs(C_B (b)) = n + 1 $

  Diferența dintre sume este:
  $ S_B - S_A = (n+1) - n = 1 $
  Scriind diferența ca sumă pe bile:
  $ sum_(b in cal(B)) lr(( 1 / abs(C_B (b)) - 1 / abs(C_A (b)) )) = 1 $

  O bilă $b$ satisface proprietatea din enunț dacă $abs(C_B (b)) < abs(C_A (b))$.
  Observăm că:
  - Dacă $abs(C_B (b)) < abs(C_A (b))$, atunci $1 / abs(C_B (b)) - 1 / abs(C_A (b)) > 0$.
  - Dacă $abs(C_B (b)) >= abs(C_A (b))$, atunci $1 / abs(C_B (b)) - 1 / abs(C_A (b)) <= 0$.

  Trebuie să arătăm că există cel puțin două bile cu contribuție strict pozitivă la sumă.
  Presupunem prin reducere la absurd că există cel mult o bilă $b^*$ care satisface proprietatea.

  *Cazul 1: Nicio bilă nu satisface proprietatea.*
  Toți termenii sumei sunt $<= 0$, deci suma totală $<= 0$, ceea ce contrazice faptul că suma este $1$.

  *Cazul 2: Exact o bilă $b^*$ satisface proprietatea.*
  Fie $y = abs(C_B (b^*))$ și $x = abs(C_A (b^*))$, cu $y < x$.
  Avem:
  $ lr(( 1/y - 1/x )) + sum_(b != b^*) underbrace(lr(( 1/abs(C_B (b)) - 1/abs(C_A (b)) )), <= space 0) = 1 $
  
  Pentru ca egalitatea să aibă loc, termenul pozitiv trebuie să compenseze termenii negativi și să dea totalul 1. Deci, este necesar ca:
  $ 1/y - 1/x >= 1 $
  Deoarece $x >= 2$ (dacă $x=1$, nu am putea avea $y < x$ cu $y >= 1$), avem $1/x > 0$.
  $ 1/y >= 1 + 1/x > 1 => y < 1 $
  Dar $y$ reprezintă numărul de bile dintr-o cutie, deci $y$ trebuie să fie un întreg $>= 1$. Am ajuns la o contradicție ($y < 1$).

  *Concluzie:*
  Presupunerea că există cel mult o bilă este falsă. Prin urmare, există cel puțin două bile pentru care $abs(C_B (b)) < abs(C_A (b))$.
]

// ============================================================================
// PROBLEMA 29156
// ============================================================================
#problem(29156, author: "Petru Braica")[
  Fie triunghiul oarecare $A B C$ și $H, G$ și $F$ punctele de contact ale cercului înscris în triunghi cu laturile $B C, C A$ respectiv $A B$. Fie $S, Q$ și $R$ picioarele bisectoarelor exterioare duse din vârfurile $A, B$ respectiv $C$.\
  Notăm cu $H_1$ simetricul lui $H$ față de dreapta $S I$. Analog definim punctele $G_1 "și" F_1$. Arătați că $H H_1, G G_1 "și" F F_1$ sunt concurente.
]

#proof[
  INCA NU!
]