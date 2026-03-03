#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari gazeta matematica 12",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 29263
// ============================================================================
#problem(29263, author: "Gheorghe Darius Pușcaș, Bistrița")[
  Determinați funcțiile $f : QQ -> QQ$ pentru care
  $ f(x+y) = f(x) + f(y) + x y, "pentru orice" x, y in QQ. $
]

#proof[
  Fie $P(x, y)$ relația $f(x+y) = f(x) + f(y) + x y$.
  Din $P(x, 0)$ obținem $f(x) = f(x) + f(0) + 0$, de unde rezultă imediat că $f(0) = 0$.

  Definim funcția auxiliară $g : QQ -> QQ$, prin $g(x) = f(x) - x^2/2$.
  Deoarece $x in QQ$, rezultă evident că $x^2/2 in QQ$, deci funcția $g$ este bine definită.
  Calculăm $g(x+y)$ folosindu-ne de ipoteză:
  $ g(x+y) &= f(x+y) - (x+y)^2/2 \
           &= f(x) + f(y) + x y - (x^2 + 2x y + y^2)/2 \
           &= f(x) - x^2/2 + f(y) - y^2/2 + x y - x y \
           &= g(x) + g(y) $

  Am obținut astfel că $g(x+y) = g(x) + g(y)$, ceea ce înseamnă că $g$ verifică ecuația funcțională a lui Cauchy pe $QQ$.
  Este cunoscut faptul că singurele soluții ale ecuației lui Cauchy pe corpul numerelor raționale sunt funcțiile liniare de forma $g(x) = c x$, pentru o constantă arbitrară $c in QQ$ (unde $c = g(1)$).

  Revenind la funcția inițială $f$, obținem forma generală a acesteia:
  $ f(x) = g(x) + x^2/2 = c x + x^2/2, quad forall x in QQ. $

  Verificând această funcție în ecuația din enunț, egalitatea se confirmă pentru orice constantă $c in QQ$.
  În concluzie, funcțiile căutate sunt cele de forma $f(x) = c x + x^2/2$, cu $c in QQ$.
]

// ============================================================================
// PROBLEMA 29264
// ============================================================================
#problem(29264, author: "George Stoica, Canada")[
  Demonstrați că nu există numerele distincte $a, b, c in ZZ^*$ pentru care
  $ sqrt(2(a^2 + b^2 + c^2 - a b - b c - c a)) in QQ. $
]

#proof[
  Presupunem prin absurd că există $a, b, c in ZZ^*$ distincte astfel încât radicalul să fie un număr rațional $q in QQ$.
  Prelucrăm expresia de sub radical:
  $ 2(a^2 + b^2 + c^2 - a b - b c - c a) = (a-b)^2 + (b-c)^2 + (c-a)^2. $
  Deoarece $a, b, c in ZZ$, expresia este un număr întreg, deci $q^2$ este întreg. Cum $q in QQ$, rezultă că $q$ trebuie să fie un număr întreg, fie acesta $k in NN$.
  Avem relația: $(a-b)^2 + (b-c)^2 + (c-a)^2 = k^2$.

  Facem notațiile $x = a-b$, $y = b-c$, $z = c-a$. Cum $a, b, c$ sunt distincte, $x, y, z$ sunt numere întregi nenule.
  În plus, observăm că $x + y + z = (a-b) + (b-c) + (c-a) = 0$, de unde $z = -(x+y)$.
  Înlocuind în ecuația inițială obținem:
  $ x^2 + y^2 + (-(x+y))^2 = k^2 => 2(x^2 + x y + y^2) = k^2. $
  Deoarece membrul stâng este par, $k^2$ este par, deci $k$ este par. Fie $k = 2m$, cu $m in NN$. Ecuația devine:
  $ 2(x^2 + x y + y^2) = 4m^2 => x^2 + x y + y^2 = 2m^2. $
  Membrul drept este par, deci $x^2 + x y + y^2$ trebuie să fie par. Analizăm paritatea lui $x$ și $y$:
  - Dacă $x, y$ sunt ambele impare, expresia este $"impar" + "impar" + "impar" = "impar"$ (fals).
  - Dacă unul este par și celălalt impar, expresia este $"par" + "par" + "impar" = "impar"$ (fals).
  Așadar, $x$ și $y$ trebuie să fie ambele pare. Fie $x = 2x_1$ și $y = 2y_1$. Înlocuind și simplificând prin 4, obținem:
  $ x_1^2 + x_1 y_1 + y_1^2 = 2m_1^2, quad "unde" m_1 = m/2. $
  Am obținut o ecuație identică, de unde, prin metoda coborârii infinite a lui Fermat, singura soluție este $x = y = 0$.
  Dar $x = a-b = 0 => a=b$, ceea ce contrazice ipoteza că $a, b, c$ sunt distincte.
  Presupunerea este falsă, demonstrația fiind astfel încheiată.
]

// ============================================================================
// PROBLEMA 29265
// ============================================================================
#problem(29265, author: "Octavian Tiberiu Bâcâin, Bistrița")[
  Fie $A$ și $B$ două puncte distincte și $M$ o mulțime cu $n >= 2$ puncte. Știm că, pentru orice submulțime nevidă $N subset M$, $N != M$, simetricul centrului de greutate al mulțimii $N$ față de $A$ și simetricul centrului de greutate al mulțimii $M without N$ față de $B$ sunt puncte distincte și notăm cu $d_N$ dreapta determinată de acestea. Știm că dreptele $d_N$ sunt distincte două câte două când $N$ parcurge familia submulțimilor nevide de puncte din $M$. \
  a) Arătați că, pentru orice $1 <= k <= n - 1$, dreptele $d_N$ sunt concurente într-un punct $P_k$, când $N$ parcurge familia mulțimilor de $k$ puncte din $M$. \
  b) Fie $G$ centrul de greutate al punctelor din $M$ și $G'$ centrul de greutate al punctelor $P_1, P_2, dots, P_(n-1)$. Arătați că mijlocul segmentului $G G'$ se află pe dreapta $A B$.
]

#proof[
  Lucrăm vectorial în raport cu un punct de origine oarecare $O$. Notăm vectorul de poziție al unui punct $X$ cu $arrow(r)_X$.
  Fie $N subset M$ cu $|N| = k$. Atunci $|M without N| = n - k$.
  Fie $G_N$ și $G_(M without N)$ centrele de greutate ale celor două submulțimi. Avem:
  $ arrow(r)_(G_N) = 1/k sum_(X in N) arrow(r)_X quad "și" quad arrow(r)_(G_(M without N)) = 1/(n-k) sum_(X in M without N) arrow(r)_X. $
  Observăm legătura cu centrul de greutate $G$ al întregii mulțimi $M$: $k arrow(r)_(G_N) + (n-k) arrow(r)_(G_(M without N)) = n arrow(r)_G$.

  Fie $A'$ simetricul lui $G_N$ față de $A$ și $B'$ simetricul lui $G_(M without N)$ față de $B$:
  $ arrow(r)_(A') = 2arrow(r)_A - arrow(r)_(G_N) quad "și" quad arrow(r)_(B') = 2arrow(r)_B - arrow(r)_(G_(M without N)). $
  Dreapta $d_N$ trece prin $A'$ și $B'$.

  *a)* Căutăm un punct $P_k$ pe $d_N$ care să nu depindă de alegerea submulțimii $N$, ci doar de $k$.
  Orice punct de pe segmentul $A' B'$ are vectorul de poziție de forma $alpha arrow(r)_(A') + beta arrow(r)_(B')$, cu $alpha + beta = 1$.
  $ arrow(r)_(P_k) &= alpha (2arrow(r)_A - arrow(r)_(G_N)) + beta (2arrow(r)_B - arrow(r)_(G_(M without N))) \
                   &= 2 alpha arrow(r)_A + 2 beta arrow(r)_B - (alpha arrow(r)_(G_N) + beta arrow(r)_(G_(M without N))). $
  Pentru ca paranteza din dreapta să se exprime în funcție de $G$ (eliminând astfel dependența de partiția $N$), trebuie ca ponderile să fie proporționale cu $k$ și $n-k$.
  Impunem $alpha/k = beta/(n-k)$. Din $alpha + beta = 1$, deducem $alpha = k/n$ și $beta = (n-k)/n$.
  Înlocuind obținem:
  $ arrow(r)_(P_k) = (2k)/n arrow(r)_A + (2(n-k))/n arrow(r)_B - arrow(r)_G. $
  Acest vector depinde strict de elemente fixe ($A, B, G, n, k$), așadar dreptele $d_N$ pentru o mulțime de $k$ elemente fixată sunt concurente în $P_k$.

  *b)* Punctul $G'$ este centrul de greutate al punctelor $P_1, P_2, dots, P_(n-1)$, așadar:
  $ arrow(r)_(G') = 1/(n-1) sum_(k=1)^(n-1) arrow(r)_(P_k). $
  Calculăm sumele pe componente:
  $ sum_(k=1)^(n-1) (2k)/n = 2/n dot ((n-1)n)/2 = n-1, quad sum_(k=1)^(n-1) (2(n-k))/n = n-1, quad sum_(k=1)^(n-1) (-arrow(r)_G) = -(n-1)arrow(r)_G. $
  Revenind la $G'$:
  $ arrow(r)_(G') = 1/(n-1) ( (n-1)arrow(r)_A + (n-1)arrow(r)_B - (n-1)arrow(r)_G ) = arrow(r)_A + arrow(r)_B - arrow(r)_G. $
  Pentru a finaliza, găsim mijlocul $S$ al segmentului $G G'$:
  $ arrow(r)_S = (arrow(r)_G + arrow(r)_(G'))/2 = (arrow(r)_G + arrow(r)_A + arrow(r)_B - arrow(r)_G)/2 = (arrow(r)_A + arrow(r)_B)/2. $
  Rezultă că $S$ coincide cu mijlocul segmentului $A B$, așadar se află pe dreapta $A B$.
]

// ============================================================================
// PROBLEMA 29266
// ============================================================================
#problem(29266, author: "Emil Vasile, Ploiești")[
  Fie $a, b in QQ$ și $c in RR$ pentru care $[n a] + [n b] = [n c]$, pentru orice $n in NN$. Arătați că $a in ZZ$ sau $b in ZZ$.
]

#proof[
  Demonstrăm că $a + b = c$\
  $a,b in QQ => a = p/q "și" b=r/s$ cu $p,r in ZZ$ și $q,s in NN^*$\
  Fie $M = q dot s => M dot a in ZZ$ și $M dot b in ZZ$
  $ floor(n a) + floor(n b) = floor(n c) quad forall n in NN \ => floor(k M dot a) + floor(k M dot b) = floor(k M dot c) quad forall k in NN $
  $ k M dot a + k M dot b = floor(k M dot c) => k M(a+b) = floor(k M dot c) $
  $ k M (a+b) <= k M dot c < k M (a+b) + 1 $
  $ a+b <= c < a+b + 1/(k M) quad forall k in NN^* $
  Deci $c - (a+b) < 1/(k M)$\
  Presupunem prin reducere la absurd că $c - (a+b) > 0$\
  Putem gasi mereu un număr $k$ suficient de mare astfel încât $1/(k M)$ să devină mai mică decât $c-(a+b) => $ contradicție\
  $=>c-(a+b)<=0$, dar $c-(a+b)>=0 => c-(a+b) = 0 => underline(a + b = c)$.

  Am obținut $floor(n a) + floor(n b) = floor(n(a+b)) quad forall n in NN^*$\
  dar $n a + n b = floor(n a) + floor(n b) + floor({n a} + {n b})$
  $=> cancel(floor(n a)) + cancel(floor(n b)) = cancel(floor(n a)) + cancel(floor(n b)) + floor({n a} + {n b})$
  $ floor({n a} + {n b}) = 0 => 0 <= {n a} + {n b} < 1 quad forall n in NN quad quad (star) $

  Presupunem prin reducere la absurd că $a in.not ZZ$ și $b in.not ZZ$.\
  Luăm $a=p/q$ și $b=r/s$ cu $(p,q)=1$ și $(r,s)=1$ și $p,r in ZZ; space q,s>=2$\
  Fie $N = [q,s] => N a, N b in ZZ$\
  - pentru $n = 1$, relația $(star)$ devine:
    $ {a} + {b} < 1 $
  - pentru $n = N-1$, relația $(star)$ devine:
    $ {N a - a} + {N b - b} < 1 => {-a} + {-b} < 1 $
    $ 1 - {a} + 1 - {b} < 1 => {a} + {b} > 1 $
  Dar știam din cazul $n = 1$ că ${a} + {b} < 1 => $ contradicție $=>$ presupunerea facută a fost falsă $=> a in ZZ$ sau $b in ZZ$.
]

// ============================================================================
// PROBLEMA 29267
// ============================================================================
#problem(29267, author: "Andrei Chiriță, București")[
  Fie $A B C$ un triunghi ascuțitunghic și fie $D, E, F$ picioarele înălțimilor din $A, B$, respectiv $C$. Fie $X_A, X_B, X_C$ proiecțiile punctelor $D, E, F$ pe laturile $A B, B C$, respectiv $C A$. Demonstrați că centrul cercului circumscris al triunghiului $X_A X_B X_C$ se află în interiorul triunghiului $D E F$.
]

#proof[
  Fie $H$ ortocentrul triunghiului $A B C$.
  Este un fapt binecunoscut în geometria triunghiului că cele 6 proiecții ale picioarelor înălțimilor pe celelalte două laturi sunt puncte conciclice. Cercul determinat de acestea se numește *Cercul lui Taylor* al triunghiului $A B C$.
  Deoarece punctele $X_A, X_B, X_C$ reprezintă exact trei dintre aceste șase proiecții ($X_A$ este proiecția lui $D$ pe $A B$, $X_B$ a lui $E$ pe $B C$, $X_C$ a lui $F$ pe $C A$), cercul circumscris triunghiului $X_A X_B X_C$ este însuși cercul lui Taylor.

  Centrul cercului lui Taylor, pe care îl vom nota cu $S$, are proprietatea remarcabilă că coincide cu centrul radical al cercurilor exinscrise triunghiului ortic $D E F$, care la rândul său este identic cu centrul Spieker al triunghiului ortic $D E F$.
  
  Centrul Spieker al unui triunghi se definește ca fiind centrul de greutate al perimetrului triunghiului. Din punct de vedere pozițional, el coincide cu centrul cercului înscris în triunghiul median.
  Fie $M_D, M_E, M_F$ mijloacele laturilor triunghiului ortic $D E F$. Triunghiul $M_D M_E M_F$ (triunghiul median) are toate vârfurile pe conturul lui $D E F$, fiind așadar strict conținut în interiorul triunghiului $D E F$.
  Deoarece centrul cercului înscris al unui triunghi se află mereu strict în interiorul acestuia, rezultă că $S$ (centrul cercului înscris în $Delta M_D M_E M_F$) este localizat strict în interiorul triunghiului $M_D M_E M_F$, și, prin tranzitivitate, se află strict în interiorul triunghiului ortic $D E F$.
  Demonstrația este astfel completă.
]

// ============================================================================
// PROBLEMA 29268
// ============================================================================
#problem(29268, author: "Nicolae Bourbăcuț, Sarmizegetusa")[
  Fie progresiile aritmetice $(a_n)_(n>=1)$ și $(b_n)_(n>=1)$ care au proprietatea că
  $ lr([ sum_(k=1)^n a_k ]) = lr([ sum_(k=1)^n b_k ]), $
  pentru o infinitate de numere naturale $n$. Arătați că cele două progresii coincid.
]

#proof[
  Fie $r_a$ și $r_b$ rațiile celor două progresii aritmetice.
  Notăm sumele parțiale cu $S_n = sum_(k=1)^n a_k$ și $T_n = sum_(k=1)^n b_k$. Acestea au formulele generale:
  $ S_n = n/2 (2a_1 + (n-1)r_a) = r_a/2 n^2 + (a_1 - r_a/2) n \
    T_n = n/2 (2b_1 + (n-1)r_b) = r_b/2 n^2 + (b_1 - r_b/2) n. $
  Din ipoteză știm că $[S_n] = [T_n]$ pentru o infinitate de numere naturale $n$. Deoarece două numere cu aceeași parte întreagă se pot distanța cu strict mai puțin de $1$, avem condiția:
  $ |S_n - T_n| < 1, quad "pentru o infinitate de " n. $
  Calculăm diferența sumelor:
  $ S_n - T_n = (r_a - r_b)/2 n^2 + (a_1 - b_1 - (r_a - r_b)/2) n. $
  Fie această diferență un polinom de gradul al doilea în $n$: $P(n) = A n^2 + B n$.
  Dacă $A != 0$, atunci $|P(n)| \~ |A| n^2 -> oo$ când $n -> oo$, ceea ce face imposibil ca inegalitatea $|P(n)| < 1$ să fie îndeplinită de o infinitate de ori. Așadar, obligatoriu $A = 0$, ceea ce implică $(r_a - r_b)/2 = 0 <=> r_a = r_b$.

  Prin anularea lui $A$, polinomul devine $P(n) = B n$, unde $B = a_1 - b_1$.
  Relația se reduce la $|B n| < 1$ pentru o infinitate de numere naturale $n$.
  Printr-un raționament absolut identic, dacă am presupune $B != 0$, atunci modulul $|B n|$ ar tinde spre infinit, contrazicând limitarea strictă de unitate pentru o infinitate de valori.
  Prin urmare, rezultă că și $B = 0$, ceea ce se traduce imediat prin $a_1 = b_1$.

  Având primii termeni egali ($a_1 = b_1$) și rațiile egale ($r_a = r_b$), deducem că cele două progresii aritmetice coincid perfect pentru orice termen de rang $n$.
]

// ============================================================================
// PROBLEMA 29269
// ============================================================================
#problem(29269, author: "Andrei Chiriță, București")[
  Fie $cal(P)$ un poligon convex cu $n$ vârfuri și perimetru $p$. Fie $A_1, ..., A_n$ o permutare a vârfurilor lui $cal(P)$. Dacă $A_(n+1) = A_1$, demonstrați că
  $ sum_(i=1)^n A_i A_(i+1) >= p. $
]

#proof[
  Fie $L = sum_(i=1)^n A_i A_(i+1)$ lungimea liniei poligonale închise (ciclului) $C = A_1 A_2 ... A_n A_1$. Dorim să demonstrăm că $L >= p$.

  Dacă ciclul $C$ nu are auto-intersecții, deoarece vârfurile sale coincid exact cu cele $n$ vârfuri ale unui poligon convex, $C$ trebuie să reprezinte chiar conturul (frontiera) poligonului $cal(P)$. În acest caz, lungimea sa este exact perimetrul poligonului, deci $L = p$.

  Să presupunem acum că linia poligonală $C$ se auto-intersectează.  Atunci există două segmente ale ciclului, să le notăm $A_i A_(i+1)$ și $A_j A_(j+1)$ (cu $i$ și $j$ distincți și neadiacenți), care se intersectează într-un punct $X$.

  În patrulaterul convex determinat de vârfurile $A_i, A_j, A_(i+1)$ și $A_(j+1)$, segmentele $A_i A_(i+1)$ și $A_j A_(j+1)$ reprezintă exact diagonalele acestuia. 
  
  Aplicând inegalitatea triunghiului în $triangle A_i X A_j$ și $triangle A_(i+1) X A_(j+1)$, obținem:
  $ A_i X + X A_j &> A_i A_j \
    A_(i+1) X + X A_(j+1) &> A_(i+1) A_(j+1) $

  Adunând cele două inegalități, reobținem proprietatea clasică potrivit căreia suma lungimilor diagonalelor este strict mai mare decât suma lungimilor a două laturi opuse:
  $ A_i A_(i+1) + A_j A_(j+1) > A_i A_j + A_(i+1) A_(j+1) $

  Dacă înlocuim în ciclul $C$ muchiile care se intersectează ($A_i A_(i+1)$ și $A_j A_(j+1)$) cu muchiile $A_i A_j$ și $A_(i+1) A_(j+1)$, obținem un nou ciclu care continuă să treacă prin toate vârfurile: 
  $ A_1 ... A_i A_j A_(j-1) ... A_(i+1) A_(j+1) ... A_n A_1 $

  Conform inegalității de mai sus, lungimea totală a acestui nou ciclu este strict mai mică decât lungimea ciclului inițial $C$.

  Deoarece numărul de permutări posibile ale celor $n$ vârfuri (și implicit numărul de cicluri posibile) este finit, acest proces de eliminare a intersecțiilor ("uncrossing") nu poate continua la nesfârșit. El se va termina în mod obligatoriu atunci când obținem un ciclu care nu se mai auto-intersectează. 
  
  Așa cum am stabilit inițial, singurul ciclu fără auto-intersecții este frontiera poligonului $cal(P)$, care are lungimea $p$. Deoarece la fiecare pas de "descurcare" lungimea a scăzut strict, rezultă că lungimea inițială $L$ a fost strict mai mare decât $p$.

  Prin urmare, în toate cazurile, avem $L >= p$, cu egalitate dacă și numai dacă permutarea parcurge vârfurile în ordinea de pe frontiera poligonului.
]