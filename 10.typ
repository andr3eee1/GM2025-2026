#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari gazeta matematica 10",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 29215
// ============================================================================
#problem(29215, author: "Mihai Totolici")[
  Determinați șirul de numere naturale $(x_n)_(n>=1)$ pentru care
  $ sum_(k=1)^n 3^(k-1) dot floor(x_k^3/(x_k^2 - x_k + 1)) = ((2x_n - 1) dot 3^n + 1)/4, quad "pentru orice" n in NN^*. $
]

#proof[
  Luam separat $floor(x_k^3/(x_k^2 - x_k + 1))$ și simplifcăm expresia:
  $ floor(x_k^3/(x_k^2 - x_k + 1)) = floor(((x_k + 1)(x_k^2 - x_k + 1) - 1)/((x_k^2 - x_k + 1))) = floor((x_k + 1) - 1/(x_k^2 - x_k + 1)) = $
  $ = (x_k + 1) + floor(-1/(x_k^2 - x_k + 1)) $
  Dar $x_k^2 - x_k + 1 > 1 <=> x_k (x_k - 1) > 0$ ceea ce este adevarat pentru orice $x_k in NN without {0, 1}$. Deci 
  $floor(-1/(x_k^2 - x_k + 1)) = -1$, iar pentru $x_k = 0$, avem termenul de mai sus $0$, adică $x_k$. Analog pentru $x_k = 1$, avem termenul de mai sus $1$, adică $x_k$.

  Deci termenul de mai sus are formula
  $ (x_k + 1) - 1 = x_k quad quad forall k in NN^* $

  Așadar avem că
  $ sum_(k=1)^n 3^(k-1) dot x_k = ((2x_n - 1) dot 3^n + 1)/4 quad quad forall n in NN^* $
  Scriem identitatea pentru $n+1$:
  $ sum_(k=1)^(n+1) 3^(k-1) dot x_k = ((2x_(n+1) - 1) dot 3^(n+1) + 1)/4 quad quad forall n in NN^* $
  Prin scădere obținem:
  $ 3^n dot x_(n+1) = (3^(n+1) dot 2x_(n+1) - 3^(n+1) - 3^n dot 2x_n + 3^n)/4 $
  $ x_(n+1) = (6x_(n+1) - 3 - 2x_n + 1)/4 $
  $ x_(n+1) = (3x_(n+1) - x_n - 1)/2 $
  $ 2x_(n+1) = 3x_(n+1) - x_n - 1 $
  $ x_n = x_(n+1) - 1 $
  $ x_(n+1) = x_n + 1 quad quad forall n in NN^* $

  Pentru $n=1$ avem
  $ 3^0 dot x_1 = ((2x_1 - 1) dot 3 + 1)/4 $
  $ 4x_1 = 6x_1 - 3 + 1 => 2x_1 = 2 => #rect[$x_1 = 1$] $

  Deci din relatia de recurenta $x_(n+1) = x_n + 1$ obținem
  $ #rect[$x_n = n$] quad quad forall n in NN^* $
]

// ============================================================================
// PROBLEMA 29216
// ============================================================================
#problem(29216, author: "Silviu Cristea")[
  Determinați numerele reale $x > 0$ pentru care
  $ floor(x) = 1 + floor(x/2) + floor(x/2^2) + floor(x/2^3) + floor(x/2^4) + ... $
]

#proof[
  Fie $n = floor(x)$. Deoarece $x > 0$, avem $n in NN$. \
  \
  *Pasul 1: Reducerea la partea întreagă* \
  Observăm că pentru orice număr întreg $k >= 1$, are loc egalitatea:
  $ floor(x / 2^k) = floor((floor(x)) / 2^k) = floor(n / 2^k) $
  _Justificare:_ Scriem $x = n + \{x\}$, unde $0 <= \{x\} < 1$. Împărțind la $2^k$, obținem
  $ x / 2^k = n / 2^k + (\{x\}) / 2^k = floor(n/2^k) + {n/2^k} + (\{x\}) / 2^k $
  Deoarece $n$ este întreg, partea fracționară a lui $n/2^k$ este de forma $r/2^k$ cu $r in \{0, ..., 2^k-1\}$. Suma $r/2^k + (\{x\})/2^k$ este strict mai mică decât $(2^k-1)/2^k + 1/2^k = 1$. Astfel, $floor(x/2^k) = floor(n/2^k)$.

  Ecuația din enunț se rescrie în funcție de $n$:
  $ n = 1 + sum_(k=1)^infinity floor(n / 2^k) $

  *Pasul 2: Identitatea lui Legendre* \
  *Lemă:* $sum_(k=1)^infinity floor(n / 2^k) = n - s_2(n)$, unde $s_2(n)$ este suma cifrelor binare ale lui $n$.
  _Demonstrație lemă:_
  Fie reprezentarea binară $n = sum_(i=0)^m b_i 2^i$, cu $b_i in {0,1}$.
  Termenul $floor(n/2^k)$ păstrează biții de la poziția $k$ în sus, shiftați: $sum_(i=k)^m b_i 2^(i-k)$.
  Suma totală devine:
  $ sum_(k=1)^m sum_(i=k)^m b_i 2^(i-k) = sum_(i=1)^m b_i underbrace(sum_(k=1)^i 2^(i-k), "Progresie geom." = 2^i - 1) $
  $ = sum_(i=0)^m b_i (2^i - 1) = underbrace(sum b_i 2^i, n) - underbrace(sum b_i, s_2(n)) = n - s_2(n). $

  Înlocuind suma în ecuația noastră:
  $ n = 1 + (n - s_2(n)) $
  $ n = n + 1 - s_2(n) $
  $ s_2(n) = 1 $

  *Pasul 3: Determinarea soluțiilor* \
  Condiția $s_2(n) = 1$ implică faptul că reprezentarea binară a lui $n$ conține un singur bit de 1. Prin urmare, $n$ trebuie să fie o putere a lui 2:
  $ n = 2^k, wide forall k in NN $

  Revenind la variabila $x$, condiția este $floor(x) = 2^k$. Aceasta este echivalentă cu:
  $ 2^k <= x < 2^k + 1 $

  *Concluzie:*
  Mulțimea soluțiilor este reuniunea intervalelor:
  $ S = union_(k=0)^infinity [2^k, 2^k + 1) $
]

// ============================================================================
// PROBLEMA 29217
// ============================================================================
#problem(29217, author: "Cătălin Zîrnă")[
  Fie numerele naturale nenule $n, x_1, x_2, ..., x_n$ cu propietatea că $x_k <= k$, pentru orice $k in {1, 2, ..., n}$. Arătați că $x_1 + x_2 + ... + x_n$ este impar dacă și numai dacă există numerele $a_1, a_2, ..., a_n in {-1, 1}$ pentru care\ $a_1x_1 + a_2x_2 + ... + a_n x_n = 1$. 
]

#proof[
  Notăm $S = sum_(k=1)^n x_k$.

  *1. Necesitatea ($arrow.l.double$)*
  Presupunem că există $a_k in {-1, 1}$ astfel încât $sum_(k=1)^n a_k x_k = 1$.
  Observăm că pentru orice întreg $y$, avem $y equiv -y space (mod 2)$. Prin urmare, $a_k x_k equiv x_k space (mod 2)$, indiferent de semnul ales.
  Însumând aceste congruențe:
  $ sum_(k=1)^n a_k x_k equiv sum_(k=1)^n x_k (mod 2) $
  $ 1 equiv S (mod 2) $
  Deci $S$ este impar.

  *2. Suficiența ($arrow.r.double$)*
  Vom construi coeficienții $a_k in \{-1, 1\}$ alegând de la $n$ către $1$.
  Definim suma sufixului la pasul $k$ ca fiind:
  $ S_k = sum_(i=k)^n a_i x_i $
  
  Ne propunem să alegem $a_k$ astfel încât să menținem invariantul:
  $ |S_k| <= k, quad forall k in \{1, ..., n\} $

  *Algoritmul de construcție:*
  Pornim cu $S_(n+1) = 0$. Pentru fiecare $k$ de la $n$ coborând la $1$, alegem semnul $a_k$ astfel:
  - Dacă $S_(k+1) > 0$, alegem $a_k = -1$ (scădem pentru a reduce valoarea).
  - Dacă $S_(k+1) <= 0$, alegem $a_k = 1$ (adunăm pentru a crește valoarea).

  *Demonstrarea invariantului prin inducție (în jos):*
  Presupunem că $|S_(k+1)| <= k+1$. Vrem să arătăm că $|S_k| <= k$.
  Știm din ipoteză că $1 <= x_k <= k$.

  _Cazul 1:_ $S_(k+1) > 0$.
  Conform algoritmului, $a_k = -1$, deci $S_k = S_(k+1) - x_k$.
  - Limita superioară: Deoarece $S_(k+1) <= k+1$ și $x_k >= 1 -> S_k <= (k+1) - 1 = k$.
  - Limita inferioară: Deoarece $S_(k+1) >= 1$ (fiind întreg pozitiv) și $x_k <= k -> S_k >= 1 - k$. Cum $1-k > -k$, condiția este satisfăcută.
  Deci $S_k in [-k, k]$.

  _Cazul 2:_ $S_(k+1) <= 0$.
  Conform algoritmului, $a_k = 1$, deci $S_k = S_(k+1) + x_k$.
  - Limita inferioară: Deoarece $S_(k+1) >= -(k+1)$ și $x_k >= 1 -> S_k >= -(k+1) + 1 = -k$.
  - Limita superioară: Deoarece $S_(k+1) <= 0$ și $x_k <= k -> S_k <= 0 + k = k$.
  Deci $S_k in [-k, k]$.

  *Pasul final:*
  Ajungem la $k=1$. Conform invariantului demonstrat, avem $|S_1| <= 1$.
  Deci $S_1 in \{-1, 0, 1\}$.
  
  Știm din prima parte a problemei (congruența modulo 2) că paritatea sumei $S_1$ este aceeași cu paritatea sumei elementelor $x_i$. Deoarece suma elementelor este impară (din enunț), $S_1$ trebuie să fie impar.
  Așadar, $S_1 != 0$, deci $S_1 in \{-1, 1\}$.

  Dacă obținem $S_1 = 1$, am găsit soluția.
  Dacă obținem $S_1 = -1$, inversăm toate semnele ($a_k arrow -a_k$) și obținem suma $1$.
]

// ============================================================================
// PROBLEMA 29218
// ============================================================================
#problem(29218, author: "Mihai Monea")[
  Considerăm o progresie aritmetică de numere întregi, cu rația $4$, care conține printre termenii săi numărul $2025$. Determinați numerele naturale nenule $k$ cu propietatea că putem alege $k$ termeni distincți ai acestei progresii care au suma pătrat perfect.
]

#proof[
  Fie $A$ mulțimea termenilor progresiei aritmetice.
  Deoarece $r=4$ și $2025 in A$, orice termen $x in A$ satisface:
  $ x equiv 2025 equiv 1 (mod 4) $
  Deci termenii sunt de forma $4m + 1$.

  *1. Condiția necesară*
  Fie $S$ suma a $k$ termeni distincți $x_1, ..., x_k in A$.
  $ S = sum_(i=1)^k x_i equiv sum_(i=1)^k 1 equiv k (mod 4) $
  
  Problema cere ca $S$ să fie pătrat perfect. Știm că restul unui pătrat perfect la împărțirea cu 4 poate fi doar $0$ (pentru numere pare) sau $1$ (pentru numere impare).
  Așadar, avem condiția:
  $ k (mod 4) in {0, 1} $
  Deci $k$ trebuie să fie de forma $4p$ sau $4p+1$.

  *2. Condiția suficientă*
  Demonstrăm că pentru orice $k$ cu $k equiv 0, 1 (mod 4)$, există o alegere de termeni.
  
  Alegem inițial $k$ termeni consecutivi din progresie, de exemplu primii $k$ termeni pozitivi:
  $ x_1=1, x_2=5, ..., x_k = 1 + 4(k-1) $
  Fie $S_0$ suma lor. Știm că $S_0 equiv k (mod 4)$.
  
  Deoarece $k equiv 0$ sau $1 (mod 4)$, există pătrate perfecte oricât de mari cu aceeași paritate (sau același rest modulo 4).
  Alegem un pătrat perfect $N^2$ suficient de mare astfel încât:
  $ N^2 > S_0 wide "și" wide N^2 equiv k (mod 4) $
  
  Diferența $D = N^2 - S_0$ este divizibilă cu 4 (deoarece $N^2$ și $S_0$ dau același rest la 4).
  Fie $D = 4 Delta$, cu $Delta in NN^*$.
  
  Construim o nouă sumă modificând doar ultimul termen $x_k$. Îl înlocuim cu:
  $ x'_k = x_k + D = x_k + 4 Delta $
  Evident $x'_k equiv x_k equiv 1 (mod 4)$, deci $x'_k$ este în progresie.
  Deoarece $D > 0$, avem $x'_k > x_k > x_(k-1)$, deci termenii rămân distincți.
  
  Noua sumă este:
  $ S' = x_1 + ... + x_(k-1) + x'_k = S_0 + D = N^2 $
  
  *Concluzie:*
  Numerele căutate sunt cele de forma $k = 4p$ sau $k = 4p+1$, unde $p in NN$ (cu $k != 0$).
  Altfel scris: $k equiv 0, 1 (mod 4)$.
]

// ============================================================================
// PROBLEMA 29219
// ============================================================================
// TODO: De uitat peste o solutie, poate mai buna
#problem(29219, author: "Cristi Săvescu")[
  Determinați mulțimile finite de vectori $M$ pentru care există o funcție\ $f: M -> RR^*$ astfel încât 
  $ sum_(arrow(v) in M) f(arrow(v)) dot arrow(v) = 0. $
]

#proof[
  Fie $M = {arrow(v)_1, arrow(v)_2, ..., arrow(v)_n}$ mulțimea de vectori.
  Problema cere determinarea condiției necesare și suficiente pentru existența unor scalari $c_1, c_2, ..., c_n in RR^*$ (toți nenuli) astfel încât:
  $ sum_(i=1)^n c_i arrow(v)_i = 0 $

  Mulțimile $M$ sunt cele cu proprietatea că *orice vector din $M$ se poate scrie ca o combinație liniară a celorlalți vectori*.
  Formulat matematic: $forall k in {1, ..., n}, arrow(v)_k in "span"(M without {arrow(v)_k})$.

  *1. Necesitatea ($=>$).*
  _Ipoteză:_ Există coeficienții $c_i != 0$ astfel încât $c_1 arrow(v)_1 + ... + c_n arrow(v)_n = 0$.
  _Concluzie:_ Arătăm că orice vector $arrow(v)_k$ depinde de restul.

  Fixăm un indice arbitrar $k$. Din ecuația sumei nule, îl izolăm pe $arrow(v)_k$:
  $ c_k arrow(v)_k = - sum_(i != k) c_i arrow(v)_i $
  Deoarece din ipoteză $c_k != 0$, putem împărți relația la $c_k$:
  $ arrow(v)_k = sum_(i != k) (- c_i / c_k) arrow(v)_i $
  Astfel, $arrow(v)_k$ este scris ca o sumă ponderată a celorlalți vectori.

  *2. Suficiența ($arrow.l.double$).*
  _Ipoteză:_ Pentru orice $k$, vectorul $arrow(v)_k$ depinde liniar de ceilalți.
  _Concluzie:_ Există o "rețetă globală" $(c_1, ..., c_n)$ cu toți $c_i != 0$ care dă suma $0$.

  Considerăm spațiul tuturor "rețetelor" posibile care anulează suma vectorilor:
  $ S = { (x_1, ..., x_n) in RR^n | x_1 arrow(v)_1 + ... + x_n arrow(v)_n = 0 } $
  Acesta este un subspațiu liniar (nucleul aplicației liniare asociate vectorilor).

  Din ipoteză, pentru fiecare indice $k$, există cel puțin o rețetă $x^(k) in S$ în care $x_k^(k) != 0$.
  _Justificare:_ Dacă pentru un $k$ fixat, toate rețetele din $S$ ar avea $x_k = 0$, ar însemna că $arrow(v)_k$ nu poate participa la nicio relație de dependență, deci ar fi liniar independent de restul mulțimii, ceea ce contrazice ipoteza.
  
  Aceasta înseamnă că subspațiul $S$ *nu* este inclus în hiperplanul $H_k = {x | x_k = 0}$.

  Trebuie să găsim un vector de coeficienți $c in S$ care să nu fie în niciunul dintre hiperplanele $H_1, H_2, ..., H_n$.
  Altfel spus, vrem să arătăm că:
  $ S inter (union_(k=1)^n H_k) != S $
  
  _Argument:_ Știm din algebră liniară că un spațiu vectorial peste un corp infinit (cum este $RR$) nu poate fi egal cu reuniunea unui număr finit de subspații proprii.
  Deoarece $S cancel(subset) H_k$ pentru fiecare $k$, reuniunea $union H_k$ nu poate acoperi tot spațiul $S$.
  
  Rezultă că există cel puțin un vector de coeficienți $c in S$ care evită toate hiperplanele $H_k$, deci are toate componentele $c_k != 0$. Aceste componente sunt valorile funcției $f(arrow(v)_k) = c_k$.
]

// ============================================================================
// PROBLEMA 29220
// ============================================================================
#problem(29220, author: "* * *")[
  Arătați că, pentru orice $n >= 3$, există o rearanjare $a_1, a_2, ..., a_n$ a numerelor $1,2, ..., n$ astfel încât să nu existe $1 <= i < j < k <= n$ pentru care $a_i, a_j, a_k$ să fie în progresie aritmetică.
]

#proof[
  Vom construi permutarea recursiv, folosind o metodă "Divide et Impera" bazată pe separarea numerelor pare de cele impare.
  
  *Construcția recursivă:*
  Fie $P_n$ permutarea căutată pentru mulțimea ${1, 2, ..., n}$.
  1. Pentru $n=1$, $P_1 = (1)$.
  2. Pentru $n=2$, $P_2 = (1, 2)$.
  3. Pentru un $n$ general, construim $P_n$ concatenând două secvențe:
     - Prima parte conține numerele impare din ${1, ..., n}$, aranjate conform permutării $P_(ceil(n/2))$.
     - A doua parte conține numerele pare din ${1, ..., n}$, aranjate conform permutării $P_(floor(n/2))$.
  
  Formal, dacă $P_k = (y_1, y_2, ..., y_k)$, atunci:
  $ P_n = (2y_1-1, 2y_2-1, ..., "impar", ..., 2z_1, 2z_2, ..., "par") $
  unde secvența $y$ corespunde construcției pentru $ceil(n/2)$ și $z$ pentru $floor(n/2)$.

  *Demonstrație prin inducție:*
  Verificăm pentru $n=3$:\
  Impare: ${1, 3} ->$ permutarea $(1, 2)$ mapată devine $(1, 3)$.\
  Pare: ${2} ->$ permutarea $(1)$ mapată devine $(2)$.\
  Rezultat: $(1, 3, 2)$.\
  Verificare AP: $1+2 != 2 dot 3$ (Corect).

  _Pasul de inducție:_
  Presupunem că pentru orice $m < n$, construcția $P_m$ nu conține progresi aritmetice de lungime 3.
  Fie $a_1, a_2, ..., a_n$ elementele permutării $P_n$ construite mai sus.
  Presupunem prin absurd că există indicii $i < j < k$ astfel încât $a_i, a_j, a_k$ sunt în progresie aritmetică. Aceasta înseamnă:
  $ a_i + a_k = 2 a_j $

  Avem trei cazuri posibile pentru pozițiile indicilor, ținând cont că în construcția noastră toate numerele impare sunt plasate înaintea tuturor numerelor pare:

  *Cazul 1:* $a_i, a_j, a_k$ sunt toate în prima jumătate (numere impare).
  Atunci $a_i = 2y_i - 1, a_j = 2y_j - 1, a_k = 2y_k - 1$.
  Ecuația devine:
  $ (2y_i - 1) + (2y_k - 1) = 2(2y_j - 1) $
  $ 2(y_i + y_k) - 2 = 4y_j - 2 $
  $ y_i + y_k = 2y_j $
  Aceasta ar însemna că elementele $y_i, y_j, y_k$ formează o progresie aritmetică în permutarea mai mică $P_(ceil(n/2))$, ceea ce contrazice ipoteza inducției.

  *Cazul 2:* $a_i, a_j, a_k$ sunt toate în a doua jumătate (numere pare).
  Atunci $a_i = 2z_i, a_j = 2z_j, a_k = 2z_k$.
  Similar, împărțind relația $2z_i + 2z_k = 2(2z_j)$ prin 2, obținem o contradicție cu ipoteza inducției pentru $P_(floor(n/2))$.

  *Cazul 3:* Indicii traversează granița dintre impare și pare.
  Deoarece secvența este de forma $("Impare", ..., "Pare")$, și $i < j < k$, avem două sub-cazuri:
  - $a_i$ este impar, $a_j$ este impar, $a_k$ este par.
    $a_i + a_k = 2a_j => "Impar" + "Par" = "Par" => "Impar" = "Par" ("Fals")$.
  - $a_i$ este impar, $a_j$ este par, $a_k$ este par.
    $a_i + a_k = 2a_j => "Impar" + "Par" = "Par" => "Impar" = "Par" ("Fals")$.
  
  (Nota: Cazul $a_i$ impar, $a_j$ par, $a_k$ impar este imposibil din cauza ordonării indicilor $i<j<k$ și a structurii blocului $"Impar"-"Par"$).

  *Concluzie:*
  Nu există trei termeni în progresie aritmetică. Construcția este validă pentru orice $n$.
]

// ============================================================================
// PROBLEMA 29221
// ============================================================================
// TODO: De refacut cu o solutie normala la cap
#problem(29221, author: "Nicolae Bourbăcuț")[
  Fie $A B C$ un triunghi ascuțitunghic cu $A B != A C$ care are centrul de greutate în $G$ și ortocentrul în $H$. Arătați că dreapta $G H$ intersectează segmentele $(A B)$ și $(A C)$ dacă și numai dacă există $t in (0, 1)$ cu propietatea că $tg A = t dot tg B + (1-t) dot tg C$.
]

#proof[
  *Pasul 1: Traducerea condiției algebrice*
  Relația dată este $tg A = t dot tg B + (1-t) dot tg C$, cu $t in (0, 1)$.
  Aceasta este definiția exactă a faptului că $tg A$ se află *strict între* $tg B$ și $tg C$ (este o medie ponderată).
  Deoarece triunghiul este ascuțitunghic, funcția tangentă este strict crescătoare pe $(0, pi/2)$.
  Astfel, condiția este echivalentă cu ordonarea unghiurilor:
  $ min(B, C) < A < max(B, C) $
  (Adică unghiul $A$ are o măsură intermediară între $B$ și $C$).

  *Pasul 2: Abordarea vectorială*
  Știm relația vectorială fundamentală pentru ortocentru ($H$) și centrul cercului circumscris ($O$):
  $ arrow(O H) = arrow(O A) + arrow(O B) + arrow(O C) $
  
  Dreapta $G H$ este aceeași cu dreapta $O H$ (dreapta lui Euler). Pentru ca această dreaptă să intersecteze segmentele $(A B)$ și $(A C)$, ea trebuie să "intre" în triunghi prin latura $A B$ și să "iasă" prin $A C$ (sau invers).
  Acest lucru înseamnă că, raportat la dreapta $O H$, vârful $A$ trebuie să fie situat în semiplanul opus vârfurilor $B$ și $C$.

  *Pasul 3: Folosirea produsului pentru "separare"*
  Considerăm o direcție perpendiculară pe dreapta $O H$, dată de un vector $arrow(n)$. Ecuația dreptei $O H$ este $arrow(r) dot arrow(n) = 0$ (produs scalar, sau proiecție nulă).
  
  Din relația lui Hamilton:
  $ arrow(n) dot arrow(O H) = arrow(n) dot (arrow(O A) + arrow(O B) + arrow(O C)) = 0 $
  Notăm $P_A = arrow(n) dot arrow(O A)$ (poziția "semnată" a lui A față de dreaptă).
  Relația devine:
  $ P_A + P_B + P_C = 0 -> P_A = -(P_B + P_C) $

  Condiția geometrică de intersecție cu $(A B)$ și $(A C)$:
  1. $G H$ intersectează $(A B) <=> A$ și $B$ sunt de o parte și de alta $<=> P_A$ și $P_B$ au semne opuse ($P_A dot P_B < 0$).
  2. $G H$ intersectează $(A C) <=> A$ și $C$ sunt de o parte și de alta $<=> P_A$ și $P_C$ au semne opuse ($P_A dot P_C < 0$).

  Din cele două condiții rezultă că $P_B$ și $P_C$ au *același semn* (ambele opuse lui $P_A$).

  *Pasul 4: Legătura cu unghiurile*
  Se poate demonstra (prin calcul de arii sau proiecții) că "puterea" punctelor față de dreapta lui Euler respectă proporțiile:
  $ P_A tilde tg B - tg C $ (proporțional cu diferența celorlalte tangente)
  $ P_B tilde tg C - tg A $
  $ P_C tilde tg A - tg B $
  
  _(Justificare intuitivă: Dacă $B=C$, triunghiul e isoscel, dreapta e axa de simetrie, deci trece prin $A$, deci $P_A=0$. Expresia $tg B - tg C$ se anulează corect)._

  Condiția ca $P_A$ și $P_B$ să aibă semne opuse:
  $ (tg B - tg C)(tg C - tg A) < 0 $
  Condiția ca $P_A$ și $P_C$ să aibă semne opuse:
  $ (tg B - tg C)(tg A - tg B) < 0 $
  
  Înmulțind inegalitățile (sau analizând semnele), singura posibilitate ca $P_A$ să fie opus ambelor ($P_B, P_C$) este ca termenul său ($tg B - tg C$) să "domine" sau să impună ordinea.
  Mai simplu: pentru ca $G H$ să separe $A$ de $B$ și $C$, valoarea asociată lui $A$ trebuie să fie "între" valori care o forțează, ceea ce conduce (prin studiul semnelor expresiilor de mai sus) exact la condiția ca $tg A$ să fie între $tg B$ și $tg C$.

  *Concluzie:*
  Intersecția are loc $<=> min(tg B, tg C) < tg A < max(tg B, tg C) <=>$ există $t in (0, 1)$ pentru relația din enunț.
]