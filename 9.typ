#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari gazeta matematica 9",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 29191
// ============================================================================
#problem(29191, author: "Dan Dumitrescu")[
  Fie $n >= 2$ și numerele reale $x_1, x_2, ..., x_n in (1, 3)$. Arătați că pentru orice rearanjare $i_1, i_2, ..., i_n$ a indicilor $1, 2, ..., n$, are loc inegalitatea
  $ (2 sqrt(3))^n <= (x_1 + 3/x_(i_1)) (x_2 + 3/x_(i_2)) ... (x_n + 3/x_(i_n)) < 4^n. $
]

#proof[
  *Inegalitatea din stânga:*
  Aplicăm inegalitatea mediilor (AM-GM) pentru fiecare factor:
  $ x_k + 3/x_(i_k) >= 2 sqrt(3 dot x_k/x_(i_k)) $
  Înmulțind aceste relații pentru $k=1, ..., n$, obținem:
  $ product_(k=1)^n (x_k + 3/x_(i_k)) >= product_(k=1)^n (2 sqrt(3) dot sqrt(x_k/x_(i_k))) = 2^n dot 3^(n/2) dot sqrt((product x_k)/(product x_(i_k))) $
  Deoarece produsul numerelor $x_k$ este egal cu produsul numerelor $x_(i_k)$ (fiind aceleași numere, doar permutate), fracția de sub radical este 1. Rezultă:
  $ product_(k=1)^n (x_k + 3/x_(i_k)) >= (2 sqrt(3))^n $

  *Inegalitatea din dreapta:*
  Aplicăm inegalitatea mediilor (GM $<=$ AM) pentru cei $n$ factori ai produsului $P$:
  $ root(n, P) <= (sum_(k=1)^n (x_k + 3/x_(i_k))) / n $
  Observăm că suma termenilor $3/x_(i_k)$ este identică cu suma termenilor $3/x_k$, deoarece $i_1, ..., i_n$ este doar o permutare a indicilor $1, ..., n$. Reușim astfel să grupăm termenii cu același indice:
  $ sum_(k=1)^n (x_k + 3/x_(i_k)) = sum_(k=1)^n x_k + sum_(k=1)^n 3/x_(i_k) = sum_(k=1)^n x_k + sum_(k=1)^n 3/x_k = sum_(k=1)^n (x_k + 3/x_k) $
  Studiem expresia $x + 3/x$ pentru $x in (1, 3)$. Inegalitatea $x + 3/x < 4$ este echivalentă cu:
  $ x^2 - 4x + 3 < 0 <=> (x-1)(x-3) < 0 $
  Aceasta este adevărată pentru orice $x in (1, 3)$. Prin urmare, fiecare termen din sumă este strict mai mic ca 4:
  $ sum_(k=1)^n (x_k + 3/x_k) < sum_(k=1)^n 4 = 4n $
  Înlocuind în inegalitatea mediilor:
  $ root(n, P) < (4n)/n = 4 => P < 4^n $
]

// ============================================================================
// PROBLEMA 29192
// ============================================================================
#problem(29192, author: "Traian Preda")[
  Fie $A B C D$ un patrulater și $O$ intersecția diagonalelor acestuia. În exteriorul său se consideră punctele $E$ și $F$ astfel încât $D$ și $C$ sunt centrele de greutate ale triunghiurilor $A E O$ și $B F O$. Știind că $arrow(E F) = 2 dot arrow(A B)$, arătați că $A B C D$ este paralelogram.
]

#proof[
  Considerăm originea sistemului de axe în punctul $O$. Astfel, $arrow(r)_O = arrow(0)$.
  Scriem condițiile vectoriale pentru centrele de greutate $D$ și $C$:
  1. $D$ centrul de greutate al $triangle A E O => arrow(r)_D = 1/3 (arrow(r)_A + arrow(r)_E + arrow(r)_O) = 1/3 (arrow(r)_A + arrow(r)_E)$.
     De aici, exprimăm $arrow(r)_E = 3 arrow(r)_D - arrow(r)_A$.
  2. $C$ centrul de greutate al $triangle B F O => arrow(r)_C = 1/3 (arrow(r)_B + arrow(r)_F + arrow(r)_O) = 1/3 (arrow(r)_B + arrow(r)_F)$.
     De aici, exprimăm $arrow(r)_F = 3 arrow(r)_C - arrow(r)_B$.

  Din ipoteză avem relația $arrow(E F) = 2 dot arrow(A B)$. Scriem aceasta folosind vectorii de poziție:
  $ arrow(r)_F - arrow(r)_E = 2 (arrow(r)_B - arrow(r)_A) $
  Înlocuim expresiile lui $arrow(r)_E$ și $arrow(r)_F$ deduse mai sus:
  $ (3 arrow(r)_C - arrow(r)_B) - (3 arrow(r)_D - arrow(r)_A) = 2 arrow(r)_B - 2 arrow(r)_A $
  $ 3 (arrow(r)_C - arrow(r)_D) + arrow(r)_A - arrow(r)_B = 2 arrow(r)_B - 2 arrow(r)_A $
  $ 3 arrow(D C) = 3 arrow(r)_B - 3 arrow(r)_A $
  $ 3 arrow(D C) = 3 arrow(A B) => arrow(D C) = arrow(A B) $
  Deoarece vectorii $arrow(A B)$ și $arrow(D C)$ sunt egali, patrulaterul $A B C D$ are două laturi opuse paralele și congruente, deci este un paralelogram.
]

// ============================================================================
// PROBLEMA 29193
// ============================================================================
#problem(29193, author: "Marius Dolcan")[
  Fie $n, k in NN^*$, triunghiul $O A B$ cu $O A = n dot O B$ și punctele $M$ și $N$ pe latura $A B$ ($M$ între $A$ și $N$), cu proprietatea că 
  $ (A M) / (M N) = (M N) / (N B) = k. $
  Determinați $k$ și $n$ știind că mediana corespunzătoare laturii $M N$ din triunghiul $O M N$ coincide cu bisectoarea $angle.spheric A O B$ din triunghiul $O A B$.
]

#proof[
  Faptul că în $triangle O M N$ mediana din $O$ coincide cu bisectoarea unghiului $angle.spheric M O N$ ($= angle.spheric A O B$) implică faptul că triunghiul $O M N$ este isoscel cu $O M = O N$.
  
  Fie $arrow(b) = arrow(O B)$ și $arrow(a) = arrow(O A)$. Din ipoteză $abs(arrow(a)) = n abs(arrow(b))$. Fie $abs(arrow(b)) = l$, deci $abs(arrow(a)) = n l$.
  Punctele $M, N$ împart segmentul $A B$. Fie $N B = x$. Atunci $M N = k x$ și $A M = k M N = k^2 x$.
  Lungimea totală $A B = x(1 + k + k^2)$.
  Exprimăm vectorii de poziție (originea în $O$):
  $ arrow(r)_N = (1 dot arrow(a) + (k^2+k) arrow(b)) / (1 + k + k^2), quad arrow(r)_M = ((1+k) arrow(a) + k^2 arrow(b)) / (1 + k + k^2) $
  Condiția $O M = O N <=> abs(arrow(r)_M)^2 = abs(arrow(r)_N)^2$. Numitorii fiind egali, egalăm numărătorii la pătrat:
  $ abs((k+1)arrow(a) + k^2 arrow(b))^2 = abs(arrow(a) + (k^2+k)arrow(b))^2 $
  $ (k+1)^2 n^2 l^2 + k^4 l^2 + 2(k+1)k^2 arrow(a) dot arrow(b) = n^2 l^2 + (k^2+k)^2 l^2 + 2(k^2+k) arrow(a) dot arrow(b) $
  Împărțim prin $l^2$ și grupăm termenii. Termenul cu produsul scalar conține $cos(angle.spheric A O B)$.
  $ n^2 [(k+1)^2 - 1] + [k^4 - (k^2+k)^2] + 2 arrow(a) dot arrow(b) / l^2 [k^2(k+1) - (k^2+k)] = 0 $
  Prelucrăm coeficienții:
  1. $n^2(k^2+2k)$
  2. $k^4 - (k^2(k+1)^2) = k^2(k^2 - (k+1)^2) = k^2(-2k-1)$
  3. Coeficient produs scalar: $k^3+k^2 - k^2 - k = k^3 - k = k(k-1)(k+1)$
  Ecuația devine:
  $ n^2 k(k+2) - k^2(2k+1) + 2 n k (k^2-1) cos alpha = 0 $
  Pentru ca această relație să definească parametrii $n, k$ geometric (independent de unghiul oarecare $alpha$ al triunghiului), coeficientul lui $cos alpha$ trebuie să fie $0$.
  $ k(k^2-1) = 0 quad k in NN^* <=> k = 1 $
  Dacă $k=1$, termenii liberi devin: $n^2(3) - 1(3) = 0 => 3n^2 = 3 => n = 1$.
  Soluția este unică: $k=1, n=1$. (Geometric: $O A B$ isoscel, $M, N$ trisectează baza).
]

// ============================================================================
// PROBLEMA 29194
// ============================================================================
#problem(29194, author: "Nicolae Bourbăcuț")[
  Fie $a, b in NN$ și $A = lr({n in NN mid(bar) floor(sqrt((n+a)(n+b))) = n+a})$. Arătați că $A$ este infinită dacă și numai dacă $b in lr({a, a+1, a+2})$.
]

#proof[
  Condiția din mulțimea $A$, $[sqrt((n+a)(n+b))] = n+a$, este echivalentă cu inegalitatea dublă:
  $ n+a <= sqrt((n+a)(n+b)) < n+a+1 $

  Ridicând la pătrat (toți termenii sunt pozitivi pentru $n in NN$), obținem:
  $ <=> (n+a)^2 <= (n+a)(n+b) < (n+a+1)^2 <=>  $
  $ <=> (n+a)^2 <= (n+a)(n+b) < (n+a)^2 + 2(n+a) + 1 <=>  $
  $ <=> (n+a)^2 <= (n+a)(n+b) <= lr((n+a)^2 + 2(n+a) quad mid(bar) space colon (n+a)>0) <=>  $
  $ <=> n+a <= n+b <= lr(n+a + 2 quad mid(bar) space minus n) <=>  $
  $ <=> a <= b <= a + 2 <=> b in lr({a, a+1, a+2}) $
]

// ============================================================================
// PROBLEMA 29195
// ============================================================================
#problem(29195, author: "Mihaela Berindeanu")[
  Fie triunghiul ascuțitunghic $A B C$ cu ortocentrul $H$ și centrul cercului circumscris $O$. În exteriorul triunghiului se ridică perpendicularele $C F perp B C$ și $C G perp A C$ astfel încât triunghiurile $A B C$, $A C G$ și $B C F$ au interioarele disjuncte iar $C F = 1/2 dot A C$ și $C G = 1/2 dot B C$. Fie ${X} = O C inter F G$.\
  Arătați că $arrow(O X) = 1/2 dot (arrow(C H) + arrow(B F) + arrow(A G))$.
]

#proof[
  Folosim relația lui Sylvester pentru ortocentrul $H$: $arrow(O H) = arrow(O A) + arrow(O B) + arrow(O C)$.
  Putem scrie vectorul $arrow(C H) = arrow(O H) - arrow(O C) = arrow(O A) + arrow(O B)$.
  Descompunem vectorii din membrul drept al relației de demonstrat:
  $ arrow(B F) = arrow(O F) - arrow(O B) $
  $ arrow(A G) = arrow(O G) - arrow(O A) $
  Înlocuim în expresia dată:
  $ 1/2 (arrow(C H) + arrow(B F) + arrow(A G)) = 1/2 ( (arrow(O A)+arrow(O B)) + (arrow(O F)-arrow(O B)) + (arrow(O G)-arrow(O A)) ) $
  Termenii $arrow(O A)$ și $arrow(O B)$ se reduc:
  $ = 1/2 (arrow(O F) + arrow(O G)) $
  Aceasta reprezintă vectorul de poziție al mijlocului segmentului $F G$.
  Rămâne să demonstrăm că $X$ (intersecția dintre $O C$ și $F G$) este mijlocul lui $F G$.
  
  Acest lucru este echivalent cu a arăta că dreapta $O C$ conține mediana din $C$ a triunghiului $C F G$ (sau diagonala paralelogramului construit pe $C F$ și $C G$).
  Unghiurile din jurul lui $C$: $angle.spheric(A C B) = C$. Deoarece $C F perp B C$ și $C G perp A C$, avem $angle.spheric F C G = 180degree - C$.
  Unghiurile făcute de $C O$ cu laturile: $angle.spheric O C A = 90degree - B$ și $angle.spheric O C B = 90degree - A$.
  Verificăm unghiurile dintre $O C$ și laturile $C G, C F$:
  $ angle.spheric(O C, C G) = angle.spheric A C G + angle.spheric O C A = 90degree + (90degree - B) = 180degree - B $
  $ angle.spheric(O C, C F) = angle.spheric B C F + angle.spheric O C B = 90degree + (90degree - A) = 180degree - A $
  Raportul sinusurilor acestor unghiuri este: $sin(180-B)/sin(180-A) = (sin B) / (sin A)$.
  Pe de altă parte, în $triangle C F G$, raportul laturilor este $(C G)/(C F) = (a / 2)/(b / 2) = a/b = (sin A) / (sin B)$.
  Se știe că diagonala paralelogramului împarte unghiul în două părți ale căror sinusuri sunt invers proporționale cu laturile adiacente. Aici raportul sinusurilor ($(sin B) / (sin A)$) este inversul raportului laturilor ($(sin A) / (sin B)$).
  Rezultă că $O C$ este suportul diagonalei paralelogramului, deci trece prin mijlocul lui $F G$. Cum $X = O C inter F G$, $X$ este chiar mijlocul lui $F G$.
  Astfel, $arrow(O X) = 1/2(arrow(O F) + arrow(O G))$.
]

// ============================================================================
// PROBLEMA 29196
// ============================================================================
#problem(29196, author: "Ion Ciudin")[
  Fie șirul $(a_n)_(n>=1)$ definit prin $a_1 = 2$ și $a_(n+1) = (2^(n+1) a_n)/(2^n + (2n + 1)a_n)$, pentru orice $n >= 1$. Determinați partea intreaga a numărului $sum_(k=1)^2025 1/a_k$.
]

#proof[
  *Pasul 1: Determinarea termenului general $a_n$.*
  
  Inversăm relația de recurență dată pentru a simplifica expresia:
  $ 1/a_(n+1) = (2^n + (2n + 1)a_n)/(2^(n+1) a_n) $
  
  Desfacem fracția în două părți:
  $ 1/a_(n+1) = 2^n/(2^(n+1) a_n) + ((2n + 1)a_n)/(2^(n+1) a_n) $
  
  Simplificăm termenii:
  $ 1/a_(n+1) = 1/(2 a_n) + (2n + 1)/2^(n+1) $
  
  Pentru a elimina numitorul $2^(n+1)$, înmulțim întreaga relație cu $2^(n+1)$:
  $ 2^(n+1)/a_(n+1) = 2^(n+1)/(2 a_n) + (2n + 1) $
  $ 2^(n+1)/a_(n+1) = 2^n/a_n + 2n + 1 $
  
  Notăm șirul auxiliar $b_n = 2^n/a_n$. Relația devine:
  $ b_(n+1) = b_n + 2n + 1 $
  
  Aceasta este o recurență liniară simplă. Putem scrie termenul $b_n$ ca o sumă telescopică:
  $ b_n = b_1 + sum_(k=1)^(n-1) (b_(k+1) - b_k) $
  $ b_n = 2^1/a_1 + sum_(k=1)^(n-1) (2k + 1) $
  
  Știm că $a_1 = 2$, deci $b_1 = 2/2 = 1$. Calculăm suma:
  $ b_n = 1 + 2 sum_(k=1)^(n-1) k + sum_(k=1)^(n-1) 1 $
  $ b_n = 1 + 2 dot ((n-1)n)/2 + (n-1) $
  $ b_n = 1 + n^2 - n + n - 1 = n^2 $
  
  Așadar, am obținut $b_n = n^2$. Revenind la notația inițială:
  $ 2^n/a_n = n^2 ==> 1/a_n = n^2/2^n $

  *Pasul 2: Calculul sumei $S_n = sum_(k=1)^n k^2/2^k$ prin metoda reducerii*
  
  Vom calcula suma folosind metoda "înmulțirii cu rația și scăderii" de două ori.
  Fie $S_n = 1^2/2^1 + 2^2/2^2 + 3^2/2^3 + ... + n^2/2^n$.
  
  Înmulțim $S_n$ cu $1/2$ și scădem rezultatul din $S_n$:
  $ S_n - 1/2 S_n &= sum_(k=1)^n k^2/2^k - sum_(k=1)^n k^2/2^(k+1) \
  1/2 S_n &= 1^2/2 + sum_(k=2)^n (k^2 - (k-1)^2)/2^k - n^2/2^(n+1) \
  1/2 S_n &= 1/2 + sum_(k=2)^n (2k-1)/2^k - n^2/2^(n+1) $
  
  Deoarece pentru $k=1$, termenul $(2k-1)/2^k = 1/2$, putem include primul termen în sumă:
  $ 1/2 S_n = sum_(k=1)^n (2k-1)/2^k - n^2/2^(n+1) $
  
  Notăm suma intermediară $T_n = sum_(k=1)^n (2k-1)/2^k$. Aplicăm din nou metoda reducerii pentru $T_n$.
  $ T_n - 1/2 T_n &= sum_(k=1)^n (2k-1)/2^k - sum_(k=1)^n (2k-1)/2^(k+1) \
  1/2 T_n &= 1/2 + sum_(k=2)^n ((2k-1) - (2(k-1)-1))/2^k - (2n-1)/2^(n+1) \
  1/2 T_n &= 1/2 + sum_(k=2)^n 2/2^k - (2n-1)/2^(n+1) $
  
  Suma din mijloc este o progresie geometrică: $sum_(k=2)^n 1/2^(k-1) = 1/2 + 1/4 + ... + 1/2^(n-1)$.
  Adăugând primul termen $1/2$, obținem suma completă a puterilor inverse ale lui 2:
  $ 1/2 T_n &= (1/2 + 1/2 + 1/4 + ... + 1/2^(n-1)) - (2n-1)/2^(n+1) \
  1/2 T_n &= (sum_(j=0)^(n-1) (1/2)^j) - 1/2^0 + 1/2 - (2n-1)/2^(n+1) \
  1/2 T_n &= (1 - (1/2)^n)/(1 - 1/2) - 1/2 - (2n-1)/2^(n+1) \
  1/2 T_n &= 2(1 - 1/2^n) - 1/2 - (2n-1)/2^(n+1) $
  
  Aducând la un numitor comun și simplificând expresia pentru $T_n$:
  $ T_n = 3 - (2n+3)/2^n $
  
  Revenim la $S_n$. Știm că $1/2 S_n = T_n - n^2/2^(n+1)$.
  $ 1/2 S_n = (3 - (2n+3)/2^n) - n^2/2^(n+1) \
  1/2 S_n = 3 - (2(2n+3) + n^2)/2^(n+1) \
  S_n = 6 - (n^2 + 4n + 6)/2^n $

  *Pasul 3: Finalizare*
  
  Pentru $n = 2025$, avem:
  $ S = 6 - (2025^2 + 4 dot 2025 + 6)/2^2025 $
  
  Deoarece fracția $E = (2025^2 + 4 dot 2025 + 6)/2^2025$ este strict pozitivă și subunitară (numitorul este mult mai mare decât numărătorul), rezultă:
  $ S = 6 - E, " unde " 0 < E < 1 ==> [S] = 5 $
]

#problem(29197, author: "Cristi Săvescu")[
  Fie $n >= 2$. Determinați numerele $(a_k)_(1<=k<=2^n-1)$ în progresie aritmetică, pentru care există o mulțime $M$ cu $n$ numere întregi astfel încât
  $ lr({sum_(a in A) a mid(bar) A subset.eq M, A != emptyset}) = lr({a_1, a_2, ..., a_(2^n-1)}) $ 
]

#proof[
  Fie $S$ mulțimea tuturor sumelor submulțimilor nevide ale lui $M$.
  Știm că mulțimea $M$ are $n$ elemente, deci există exact $2^n - 1$ submulțimi nevide.
  Deoarece problema specifică faptul că mulțimea sumelor $S$ este identică cu mulțimea termenilor progresiei $\{a_1, ..., a_(2^n-1)\}$, care are tot cardinalul $2^n - 1$, rezultă o proprietate fundamentală:
  
  *Toate sumele submulțimilor nevide ale lui $M$ sunt distincte.*

  Fie elementele mulțimii $M = {x_1, x_2, ..., x_n}$. Fără a restrânge generalitatea, le putem ordona crescător:
  $ x_1 < x_2 < ... < x_n $

  Vom demonstra prin inducție (sau construcție directă) forma elementelor $x_i$.

  *Pasul 1: Analiza celor mai mici sume*
  Considerăm cazul în care $x_1 > 0$. (Dacă $x_i$ sunt negative, raționamentul este simetric, iar progresia este doar parcursă în sens invers).
  Cele mai mici sume posibile formate cu elemente din $M$ sunt, în ordine:
  1. $x_1$ (cea mai mică sumă posibilă)
  2. $x_2$
  3. $x_1 + x_2$
  
  Deoarece sumele trebuie să formeze o progresie aritmetică fără "goluri" între termeni, diferența dintre termenii consecutivi trebuie să fie constantă (rația $r$).
  Astfel, diferența dintre a doua și prima sumă trebuie să fie egală cu diferența dintre a treia și a doua sumă:
  $ x_2 - x_1 = (x_1 + x_2) - x_2 $
  $ x_2 - x_1 = x_1 ==> x_2 = 2 x_1 $

  Așadar, primele două elemente sunt $x_1$ și $2x_1$. Sumele generate de acestea sunt ${x_1, 2x_1, 3x_1}$. Acestea formează o progresie aritmetică de rație $x_1$.

  *Pasul 2: Extinderea prin inducție*
  Presupunem că primele $k$ elemente ale lui $M$ sunt de forma:
  $ {m, 2m, 4m, ..., 2^(k-1)m} $
  unde $m = x_1$.
  Aceste $k$ elemente generează toate sumele de forma $j dot m$ pentru $1 <= j <= 2^k - 1$.
  Cea mai mare sumă generată de primele $k$ elemente este:
  $ S_max = (2^k - 1)m $
  
  Pentru ca, adăugând elementul $x_(k+1)$, să continuăm progresia aritmetică fără a lăsa goluri și fără a suprapune valori (pentru a păstra unicitatea sumelor), următorul termen al progresiei trebuie să fie imediat după $S_max$.
  Următorul termen necesar în progresie este:
  $ a_(2^k) = S_max + m = (2^k - 1)m + m = 2^k m $
  
  Singura modalitate de a obține această sumă folosind $x_(k+1)$ (și eventual submulțimi ale celorlalte elemente) ca fiind cea mai mică sumă nouă este ca însuși $x_(k+1)$ să fie egal cu această valoare (deoarece orice sumă $x_(k+1) + "ceva pozitiv"$ ar fi și mai mare).
  Deci:
  $ x_(k+1) = 2^k m $

  *Concluzie privind structura lui M*
  Prin inducție, rezultă că mulțimea $M$ trebuie să fie de forma:
  $ M = {m, 2m, 4m, ..., 2^(n-1)m}, quad m in ZZ^* $

  *Determinarea progresiei $(a_k)$*
  Sumele tuturor submulțimilor lui $M$ vor fi:
  $ sum_(j in J) (2^j m) = m dot sum_(j in J) 2^j $
  Deoarece sumele puterilor distincte ale lui 2 generează reprezentarea binară a oricărui număr întreg, mulțimea sumelor va fi: ${ 1m, 2m, 3m, ..., (2^n - 1)m }$

  Distingem două cazuri pentru șirul ordonat $(a_k)$:
  1.  Dacă $m > 0$: Progresia este strict crescătoare cu $a_k = k dot m$.
  2.  Dacă $m < 0$: Progresia este strict crescătoare, dar termenii sunt ordonați invers față de valoarea absolută.
      $ a_1 = (2^n - 1)m, quad ..., quad a_(2^n-1) = m $
      Aceasta este o progresie cu rația $|m|$.

  *Răspuns final:*
  Numerele sunt de forma $a_k = k dot m$ (sau ordinea inversă pentru $m < 0$), unde $m$ este un număr întreg nenul arbitrar.
]