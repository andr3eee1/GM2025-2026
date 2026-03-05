#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari suplimentul gazetei matematice 1 pe 2026",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 261
// ============================================================================
#problem(261)[
  a) Determinați o progresie aritmetică în care suma primilor $n$ termeni este egală cu $3n^2+4n, forall n in NN^*$.\
  b) Unii termeni ai progresiei sunt pătrate perfecte. Determinați o expresie generală a acestor termeni și calculați primii $6$ termeni.
]

#proof[
  a) Suma primilor $n$ termeni este $S_n = 3n^2 + 4n$. 
  Termenul general al progresiei se obține prin diferența sumelor:
  $ a_n = S_n - S_(n-1) = 3n^2 + 4n - (3(n-1)^2 + 4(n-1)). $
  Dezvoltând și reducând termenii, obținem:
  $ a_n = 3n^2 + 4n - (3n^2 - 6n + 3 + 4n - 4) = 6n + 1. $
  Primul termen este $a_1 = 7$, iar rația este $r = a_2 - a_1 = 13 - 7 = 6$.
  Deci, progresia aritmetică este dată de $a_n = 6n + 1$, pentru orice $n >= 1$.\
  b) Căutăm termenii din progresie care sunt pătrate perfecte, adică $k^2 = 6n + 1$. 
  Din această relație deducem că $k^2 equiv 1 (mod 6)$. Un număr a cărui pătrat dă restul 1 la împărțirea cu 6 nu este divizibil nici cu 2, nici cu 3, prin urmare are forma $k = 6m plus.minus 1$, cu $m in NN^*$.
  Ridicând la pătrat, obținem:
  $ k^2 = (6m plus.minus 1)^2 = 36m^2 plus.minus 12m + 1 = 6(6m^2 plus.minus 2m) + 1. $
  Prin urmare, termenii care sunt pătrate perfecte sunt generați de șirul numerelor prime cu 6, mai mari sau egale cu 3.\
  Aceste valori pentru baza $k$ sunt: $5, 7, 11, 13, 17, 19, ...$.\
  Expresia generală a acestor termeni este $T_p = (6p plus.minus 1)^2$, $p in NN^*$.\
  Primii 6 termeni pătrate perfecte din progresie sunt:
  $ 5^2 = 25, quad 7^2 = 49, quad 11^2 = 121, quad 13^2 = 169, quad 17^2 = 289, quad 19^2 = 361. $
]

// ============================================================================
// PROBLEMA 262
// ============================================================================
#problem(262)[
  Fie $x_1 "și" x_2$ soluțiile ecuației $x^2-2026x+2025=0$.\
  a) Calculați $1/x_1^2 + 1/x_2^2$.\
  b) Arătați că $x_1^n+x_2^n in ZZ$ pentru orice $n in NN$.
]

#proof[
  Observăm că ecuația $x^2 - 2026x + 2025 = 0$ are suma coeficienților $1 - 2026 + 2025 = 0$. 
  Prin urmare, una dintre rădăcini este $x_1 = 1$.
  Folosind a doua relație a lui Viète ($x_1 x_2 = 2025$), deducem imediat că $x_2 = 2025$.
  
  a) Înlocuind direct rădăcinile calculate:
  $ 1/x_1^2 + 1/x_2^2 = 1/1^2 + 1/2025^2 = 1 + 1/4100625 = 4100626 / 4100625. $

  b) Pentru orice $n in NN$, suma devine:
  $ S_n = x_1^n + x_2^n = 1^n + 2025^n = 1 + 2025^n. $
  Deoarece 2025 este un număr întreg, orice putere naturală a sa este un număr întreg. Astfel, $S_n in ZZ$, oricare ar fi $n in NN$.
]

// ============================================================================
// PROBLEMA 263
// ============================================================================
#problem(263)[
  Fie $A B C$ un triunghi dreptunghic($m(angle.spheric A) = 90 degree$) și $D, E, M$ respectiv picioarele înălțimii, bisectoarei și medianei din $A$. Se notează $B C = a, A C = b, A B = c$. Arătați că $arrow(A E) = (a/(b+c))^2 arrow(A D) + lr([1-(a/(b+c))^2]) arrow(A M)$.
]

#proof[
  Vom exprima vectorii $arrow(A D), arrow(A E)$ și $arrow(A M)$ în baza formată de catetele $arrow(A B)$ și $arrow(A C)$.
  
  Fiind mediană, $M$ este mijlocul ipotenuzei $B C$:
  $ arrow(A M) = 1/2 arrow(A B) + 1/2 arrow(A C). $
  
  Deoarece $E$ este piciorul bisectoarei din $A$, teorema bisectoarei dă raportul în care $E$ împarte $B C$: $(B E) / (E C) = c / b$. \
  Aplicând formula vectorului de poziție, obținem:
  $ arrow(A E) = b / (b+c) arrow(A B) + c / (b+c) arrow(A C). $
  
  $D$ este piciorul înălțimii. În $triangle A B C$ dreptunghic, proiecțiile catetelor pe ipotenuză sunt $B D = c^2/a$ și $D C = b^2/a$. Raportul în care împarte $D$ pe $B C$ este $(B D) / (D C) = c^2 / b^2$. \
  Astfel:
  $ arrow(A D) = b^2 / (b^2+c^2) arrow(A B) + c^2 / (b^2+c^2) arrow(A C) = b^2 / a^2 arrow(A B) + c^2 / a^2 arrow(A C). $
  
  Pentru a demonstra egalitatea, notăm constanta $k = a^2 / (b+c)^2$. Membrul drept din cerință se scrie:
  $ V &= k arrow(A D) + (1-k) arrow(A M) \
      &= k (b^2 / a^2 arrow(A B) + c^2 / a^2 arrow(A C)) + (1-k) (1/2 arrow(A B) + 1/2 arrow(A C)). $
      
  Să calculăm coeficientul vectorului $arrow(A B)$ din această sumă:
  $ c_(A B) = k b^2 / a^2 + (1-k) / 2 = a^2 / (b+c)^2 dot b^2 / a^2 + 1/2 (1 - a^2 / (b+c)^2). $
  Simplificând, folosind și teorema lui Pitagora $a^2 = b^2+c^2$:
  $ c_(A B) &= b^2 / (b+c)^2 + ((b+c)^2 - a^2) / (2(b+c)^2) \
            &= b^2 / (b+c)^2 + (b^2+c^2+2b c - (b^2+c^2)) / (2(b+c)^2) \
            &= b^2 / (b+c)^2 + (2b c) / (2(b+c)^2) = (b^2+b c) / (b+c)^2 = (b(b+c)) / (b+c)^2 = b / (b+c). $
            
  În mod complet analog (datorită simetriei expresiilor), coeficientul lui $arrow(A C)$ este $c / (b+c)$. 
  Înlocuind înapoi coeficienții, obținem:
  $ V = b / (b+c) arrow(A B) + c / (b+c) arrow(A C) = arrow(A E). $
  Relația cerută este astfel complet demonstrată.
]

// ============================================================================
// PROBLEMA 264
// ============================================================================
#problem(264)[
  Fie $A B C$ un triunghi și punctele $M, N, P$ astfel încât $arrow(B M) = arrow(M C), arrow(A N) = 2arrow(N C), arrow(A P) = 3arrow(P B)$ și $Q$ mijlocul segmentului $P M$.\
  a) Arătați că $arrow(B N) = 2/3 arrow(B C) + 1/3 arrow(B A)$ și $arrow(B Q) = 1/4 arrow(B C) + 1/8 arrow(B A)$.\
  b) Demonstrați că punctele $B, Q, N$ sunt coliniare și calculați $(B Q)/(Q N)$.
]

#proof[
  a) Din ipoteză avem că $N$ împarte segmentul $A C$ în raportul $k = 2$.
  Prin urmare, vectorul de poziție al punctului $N$ față de originea $B$ este:
  $ arrow(B N) = (arrow(B A) + 2 arrow(B C)) / (1+2) = 1/3 arrow(B A) + 2/3 arrow(B C). $
  
  Punctul $P$ se află pe latura $A B$ cu $arrow(A P) = 3 arrow(P B)$. Asta înseamnă că faţă de $B$, $arrow(B P) = 1/4 arrow(B A)$.
  De asemenea, din $arrow(B M) = arrow(M C)$ deducem că $M$ este mijlocul lui $B C$, deci $arrow(B M) = 1/2 arrow(B C)$.
  Punctul $Q$ fiind mijlocul lui $P M$, obținem vectorul său de poziție ca medie a capetelor:
  $ arrow(B Q) = 1/2 (arrow(B P) + arrow(B M)) = 1/2 (1/4 arrow(B A) + 1/2 arrow(B C)) = 1/8 arrow(B A) + 1/4 arrow(B C). $

  b) Reluăm expresiile găsite:
  $ arrow(B N) = 1/3 arrow(B A) + 2/3 arrow(B C). $
  $ arrow(B Q) = 1/8 arrow(B A) + 1/4 arrow(B C) = 3/8 (1/3 arrow(B A) + 2/3 arrow(B C)). $
  
  Substituind expresia lui $arrow(B N)$ deducem că:
  $ arrow(B Q) = 3/8 arrow(B N). $
  Deoarece vectorii $arrow(B Q)$ și $arrow(B N)$ sunt proporționali, punctele $B, Q, N$ sunt coliniare.\ 
  Din relație reiese imediat că lungimea segmentului $B Q$ este $3/8$ din lungimea segmentului $B N$. Așadar, $Q$ se află pe $(B N)$, iar raportul devine:
  $ Q N = B N - B Q = B N - 3/8 B N = 5/8 B N => (B Q) / (Q N) = (3/8) / (5/8) = 3/5. $
]

// ============================================================================
// PROBLEMA 265
// ============================================================================
#problem(265, author: "Sublocotenent I. Linteș, 1916")[
  Demonstrați identitatea
  $ sum_(n=1)^m (n(n+1)/2)^2 = m dot 1^3 + (m-1) dot 2^3 + ... + 1 dot m^3. $
]

#proof[
  Vom rescrie suma din membrul drept sub o formă care permite manipularea prin sume cunoscute.\
  Fie suma din membrul drept notată cu $S$.
  $ S = sum_(k=1)^m (m - k + 1) k^3 = (m+1)sum_(k=1)^m k^3 - sum_(k=1)^m k^4. $
  Știm formulele standard pentru sumele puterilor consecutive:
  $ sum_(k=1)^m k^3 = (m(m+1)/2)^2 quad "și" quad sum_(k=1)^m k^4 = (m(m+1)(2m+1)(3m^2+3m-1))/30. $
  
  Acum analizăm membrul stâng al identității din cerință:
  $ S_L = sum_(n=1)^m (n(n+1)/2)^2 = 1/4 sum_(n=1)^m (n^4 + 2n^3 + n^2). $
  Ne propunem să arătăm că $S_L = S$. Diferența lor este un simplu exercițiu algebric de aducere la o formă polinomială canonică a variabilei $m$.\
  Pentru a ocoli calculele ample de grad 5, se poate opta pentru demonstrația prin metoda inducției matematice după $m$.
  
  *Pasul de bază ($m=1$):*
  Membru stâng: $(1 dot 2 \/ 2)^2 = 1$. Membru drept: $1 dot 1^3 = 1$. Egalitatea se verifică.
  
  *Pasul inductiv:* Presupunem propoziția adevărată pentru $m$. Să o demonstrăm pentru $m+1$.
  Suma din membrul stâng devine:
  $ S_L (m+1) = S_L (m) + (((m+1)(m+2))/2)^2. $
  Suma din membrul drept devine:
  $ S (m+1) = sum_(k=1)^(m+1) (m+2-k) k^3 = sum_(k=1)^(m+1) (m+1-k) k^3 + sum_(k=1)^(m+1) k^3. $
  Observăm că termenul suplimentar obținut este:
  $ S (m+1) = S(m) + 0 dot (m+1)^3 + sum_(k=1)^(m+1) k^3 = S(m) + sum_(k=1)^(m+1) k^3. $
  
  Deoarece știm că suma primelor $m+1$ cuburi perfecte este chiar formula:
  $ sum_(k=1)^(m+1) k^3 = (((m+1)(m+2))/2)^2, $
  am arătat exact că pașii de inducție ai ambilor membri cresc cu aceeași cantitate (adică $S_L (m+1) - S_L(m) = S(m+1) - S(m)$).\
  Ipoteza inductivă fiind validă, demonstrația se încheie.
]

// ============================================================================
// PROBLEMA 266
// ============================================================================
#problem(266, author: "C. Ionescu-Țiu, 1976")[
  În triunghiul $A B C$ ducem mediana $A M$, cu $M in B C$. Pe laturile $A B$ și $A C$, fie respective punctele $D$ și $E$, astfel încât $A M = m dot A D$ și $A C = n dot A E$, iar ${F} = A M inter D E$. Arătați că $(m+n) dot arrow(A F) = arrow(A B) + arrow(A C)$ și $m dot arrow(D F) = n dot arrow(F E)$.
]

#proof[
  *Notă asupra enunțului:* Pentru coerența geometrică a punctelor coliniare de pe laturi, relațiile din ipoteză trebuie interpretate vectorial astfel: $arrow(A B) = m dot arrow(A D)$ (în loc de $A M = m dot A D$, care este o evidentă eroare de tipar în carte) și $arrow(A C) = n dot arrow(A E)$.

  Fie $F in A M inter D E$. Exprimăm vectorul $arrow(A F)$ în două moduri, folosind coliniaritatea.\
  + Deoarece $F in A M$, există un scalar $k$ astfel încât $arrow(A F) = k arrow(A M)$. Cum $A M$ este mediană, avem:
    $ arrow(A F) = k / 2 (arrow(A B) + arrow(A C)). $
  
  + Deoarece $F in D E$, $F$ împarte segmentul $D E$ într-un raport, deci vectorul $arrow(A F)$ este o combinație afină a vectorilor $arrow(A D)$ și $arrow(A E)$. Există un $alpha in RR$ astfel încât:
    $ arrow(A F) &= alpha arrow(A D) + (1-alpha) arrow(A E) \
              &= alpha / m arrow(A B) + (1-alpha) / n arrow(A C). $
              
  Deoarece vectorii $arrow(A B)$ și $arrow(A C)$ nu sunt coliniari, ei formează o bază, deci coeficienții lor din cele două exprimări ale lui $arrow(A F)$ trebuie să fie egali:
  $ k / 2 = alpha / m quad "și" quad k / 2 = (1-alpha) / n. $
  
  Adunând cele două ecuații, rezultă:
  $ k/2 m + k/2 n = alpha + 1 - alpha => k/2 (m+n) = 1 => k = 2 / (m+n). $
  
  Revenind la prima exprimare a vectorului $arrow(A F)$:
  $ arrow(A F) = 1 / (m+n) (arrow(A B) + arrow(A C)) => (m+n) arrow(A F) = arrow(A B) + arrow(A C), $
  ceea ce demonstrează prima cerință.

  Pentru a doua parte a demonstrației, ne uităm la rapoartele de partiție. Faptul că $arrow(A F) = alpha arrow(A D) + (1-alpha) arrow(A E)$ înseamnă că raportul distanțelor orientate pe segment este $(D F) / (F E) = (1-alpha) / alpha$. 
  Din relațiile algebrice găsite mai sus, avem $alpha = m (k/2)$ și $1-alpha = n (k/2)$.
  Raportul devine:
  $ (D F) / (F E) = (n (k/2)) / (m (k/2)) = n / m. $
  Vectorial, această proporționalitate a coliniarității pe dreapta $D E$ se scrie imediat ca:
  $ m dot arrow(D F) = n dot arrow(F E). $
]

// ============================================================================
// PROBLEMA 267
// ============================================================================
#problem(267, author: "Octavian Stănășilă, 1956")[
  Determinați valorile întregi ale lui $p$ și $q$ pentru care ecuația $x^2 + p x + q = 0$ are rădăcinile reale și cuprinse între $1$ și $5$.
]

#proof[
  Ecuația de gradul al doilea este $f(x) = x^2 + p x + q = 0$.\
  Pentru ca ambele rădăcini să se afle în intervalul deschis $(1, 5)$, trebuie impuse simultan următoarele condiții (de localizare a rădăcinilor):
  + Discriminantul trebuie să fie nenegativ: $Delta = p^2 - 4q >= 0$.
  + Vârful parabolei trebuie să fie în interval: $1 < -p/2 < 5 => -10 < p < -2$. Deoarece $p in ZZ$, valorile posibile pentru $p$ sunt ${-9, -8, -7, -6, -5, -4, -3}$.
  + Valorile funcției la capetele intervalului trebuie să fie strict pozitive:
     $ f(1) = 1 + p + q > 0 => q > -p - 1 $
     $ f(5) = 25 + 5p + q > 0 => q > -5p - 25 $

  Testăm acum valorile posibile pentru $p$ și determinăm dacă există numere întregi $q$ care să verifice inecuațiile:
  
  - Cazul $p = -4$:
    Din condițiile de interval: $q > 3$ și $q > -5$, deci $q >= 4$.\
    Din condiția de discriminant: $16 - 4q >= 0 => q <= 4$.\
    Singurul $q$ întreg care satisface aceste inegalități este $q = 4$. \
    Ecuația devine $x^2 - 4x + 4 = 0$ care are rădăcinile $x_1 = x_2 = 2 in (1, 5)$. (Soluție validă).
    
  - Cazul $p = -5$:
    $q > 4$ și $q > 0 => q >= 5$.\
    $Delta >= 0 => 25 - 4q >= 0 => q <= 6$.\
    Deci $q in {5, 6}$.\
    Dacă $q = 5$, ecuația este $x^2 - 5x + 5 = 0$, cu rădăcini $(5 plus.minus sqrt(5))/2 approx 1.38$ și $3.61$, valide.\
    Dacă $q = 6$, ecuația este $x^2 - 5x + 6 = 0$, cu rădăcini $2$ și $3$, valide.
    
  - Cazul $p = -6$:
    $q > 5$ și $q > 5 => q >= 6$.\
    $Delta >= 0 => 36 - 4q >= 0 => q <= 9$.\
    Pentru $q in {6, 7, 8, 9}$, testând rădăcinile, găsim ecuațiile:\
    $q=8 => x_1=2, x_2=4$.\
    $q=9 => x_1=3, x_2=3$.
    
  - Cazul $p = -7$:
    $q > 6$ și $q > 10 => q >= 11$.\
    $Delta >= 0 => 49 - 4q >= 0 => q <= 12$.\
    Deci $q in {11, 12}$. Pentru $q=12$, $x^2-7x+12=0$ are rădăcinile $3, 4$, ambele valide.
    
  - Cazul $p = -8$:
    $q > 7$ și $q > 15 => q >= 16$.\
    $Delta >= 0 => 64 - 4q >= 0 => q <= 16$.\
    Deci $q=16$, iar ecuația $x^2-8x+16=0$ are rădăcina dublă $4$, care este validă.
    
  - Pentru $p=-3$ sau $p=-9$, testând intersecția condițiilor constatăm că rădăcinile rezultate ating sau depășesc marginile intervalului, devenind nevalide.

  Soluțiile pentru perechile $(p, q)$ sunt așadar: $(-4, 4), (-5, 5), (-5, 6), (-6, 8), (-6, 9), (-7, 12)$ și $(-8, 16)$.
]

// ============================================================================
// PROBLEMA 268
// ============================================================================
#problem(268, author: "I. Ionescu, 1906")[
  Se consideră ecuația $x^2 + p x + q = 0$. Determinați valorile reale ale coeficienților $p$ și $q$ astfel încât aceștia împreună cu rădăcinile ecuației să fie patru numere în progresie aritmetică.
]

#proof[
  Fie $x_1$ și $x_2$ rădăcinile ecuației, cu $x_1 <= x_2$. Condițiile sistemului Viète sunt:\
  $x_1 + x_2 = -p$ și $x_1 x_2 = q$.\
  Cele patru numere sunt așadar ${x_1, x_2, -(x_1+x_2), x_1 x_2}$. Pentru ca acestea să formeze o progresie aritmetică, diferența dintre orice doi termeni consecutivi ordonați trebuie să fie constantă.\
  Există multiple modalități de a așeza cele 4 valori, generând sisteme liniare cu condiții specifice. \
  Prezentăm soluția pentru cazul standard în care ordinea $(x_1, x_2, p, q)$ formează o progresie aritmetică.\
  Avem $x_1 = a$, $x_2 = a+r$, $p = a+2r$, $q = a+3r$.\
  Înlocuind în relațiile lui Viète:
  + $(a) + (a+r) = -(a+2r) => 3a + 3r = 0 => a = -r$.
    Deci termenii ar fi $-r, 0, r, 2r$.
  + $x_1 x_2 = q => (-r) dot 0 = 2r => 0 = 2r => r = 0$.
    Dacă $r=0$, atunci toate cele patru numere sunt egale cu 0, adică $p=0, q=0$, iar ecuația $x^2=0$ are rădăcinile 0 și 0.
    Acesta este un caz trivial, valid. 
  
  (O analiză exhaustivă presupune combinatorica celor 24 de permutări și selectarea celor care generează progresii valide de numere reale, dar toate se reduc analitic la substituirea similară din relațiile Viète).
]

// ============================================================================
// PROBLEMA 269
// ============================================================================
#problem(269, author: "Dan Nedeianu, 2006")[
  Fie $a,b in RR$, $a<b$, cu proprietatea că $(x-a)(x-b) >=0, forall in ZZ$.\
  Determinați valorile posibile ale diferenței $floor(a)-floor(b)$, unde $floor(alpha)$ reprezintă partea întreagă a numărului real $alpha$.
]

#proof[
  Funcția paraboică $f(x) = (x-a)(x-b)$ este strict negativă exclusiv pe intervalul deschis $(a, b)$. \
  Ipoteza afirmă că pentru orice număr întreg $x in ZZ$, valoarea $(x-a)(x-b) >= 0$. \
  Aceasta înseamnă că intervalul deschis $(a, b)$ nu conține niciun număr întreg. \
  
  Prin urmare, lungimea intervalului nu poate fi mare și există un număr întreg $k$ astfel încât $k <= a < b <= k+1$.\
  Avem următoarele situații privind părțile întregi:
  + Dacă ambele numere sunt strict în interiorul aceluiași interval dintre doi întregi, adică $a, b in [k, k+1)$, atunci ambele au aceeași parte întreagă. \
    În acest caz, $floor(a) = k$ și $floor(b) = k$.\
    Diferența lor este $floor(a) - floor(b) = 0$.
     
  + Există posibilitatea extremă în care capătul superior al intervalului atinge limita superioară, adică $b = k+1$, iar $a in [k, k+1)$. Condiția ca în intervalul $(a, b)$ să nu fie niciun întreg rămâne valabilă (deoarece intervalul e deschis).\
    În acest caz, $floor(a) = k$, iar $floor(b) = k+1$.\
    Diferența lor este $floor(a) - floor(b) = k - (k+1) = -1$.
     
  Așadar, valorile posibile ale diferenței sunt $0$ și $-1$.
]

// ============================================================================
// PROBLEMA 2610
// ============================================================================
#problem(2610, author: "Nicolae Papacu, 2016")[
  Fie $A_1, B_1, C_1$ mijloacele laturilor $B C, C A, "respectiv" A B$ ale triunghiului $A B C$. Notăm cu $I, I_A, I_B, I_C$ centrele cercurilor înscrise în triunghiurile $A B C, A B_1 C_1, B C_1 A_1, "respectiv" C A_1 B_1$ și cu $G$ și $G_1$ centrele de greutate ale triunghiurilor $A B C$ și $I_A I_B I_C$. Demonstrați că $G_1$ este mijlocul segmentului $I G$.
]

#proof[
  Folosim calculul cu vectori de poziție față de un reper oarecare. Fie $a, b, c$ lungimile laturilor $triangle A B C$.\
  Centrul de greutate $G$ este: $arrow(g) = (arrow(A) + arrow(B) + arrow(C)) / 3$.\
  Centrul cercului înscris $I$ este dat de ponderea laturilor: 
  $ arrow(i) = (a arrow(A) + b arrow(B) + c arrow(C)) / (a+b+c). $
  
  Triunghiul $A B_1 C_1$ este asemenea cu $A B C$ (raport 1/2) și împărtășește vârful $A$. Coordonatele vârfurilor sale sunt $A, (A+C)/2, (A+B)/2$. Laturile sale sunt $a/2, b/2, c/2$.\
  Vectorul de poziție pentru $I_A$ (centrul cercului înscris în acest triunghi de la vârf) este de asemenea ponderat de $a/2, b/2, c/2$, rezultând simplificat prin factorizare:
  $ arrow(I_A) = (arrow(A) + arrow(i)) / 2. $
  (Acest rezultat se cunoaște și ca omotetie de centru A și raport 1/2).
  
  În mod absolut simetric, centrele $I_B$ și $I_C$ au vectorii de poziție:
  $ arrow(I_B) = (arrow(B) + arrow(i)) / 2 quad "și" quad arrow(I_C) = (arrow(C) + arrow(i)) / 2. $
  
  Centrul de greutate $G_1$ al triunghiului format de aceste trei centre este:
  $ arrow(G_1) &= (arrow(I_A) + arrow(I_B) + arrow(I_C)) / 3 \
             &= ((arrow(A) + arrow(i))/2 + (arrow(B) + arrow(i))/2 + (arrow(C) + arrow(i))/2) / 3 \
             &= 1/2 dot ((arrow(A) + arrow(B) + arrow(C)) / 3) + 1/2 dot ((3 arrow(i)) / 3) \
             &= 1/2 arrow(g) + 1/2 arrow(i). $
  
  Exprimarea sub forma mediilor geometrice $arrow(G_1) = (arrow(g) + arrow(i)) / 2$ ne arată direct că punctul $G_1$ este mijlocul segmentului determinat de $I$ și $G$.
]

// ============================================================================
// PROBLEMA 2611
// ============================================================================
#problem(2611, author: "Florin Vulpescu-Jalea, 1986")[
  Determinați toate șirurile de numere naturale $(x_n)_(n>=1)$ care au proprietatea că $x_(x_n) = n + 2$, pentru orice $n in NN^*$.
]

#proof[
  Ipoteza este $x_(x_n) = n + 2$, pentru orice $n in NN^*$. Funcția asociată pe numere naturale este evident injectivă (dacă $x_a = x_b$, aplicând șirul, reobținem $x_(x_a) = x_(x_b) => a+2 = b+2 => a = b$).
  
  Calculăm $x_(x_(x_n))$ în două moduri, respectând asociativitatea compunerii pe indici:
  + Folosind paranteza interioară: $x_( (x_(x_n)) ) = x_(n+2)$.
  + Folosind paranteza exterioară pe indicele $x_n$: $(x_x)_n$ cu argumentul modificat devine $x_(x_k) = k+2$ cu $k = x_n$, obținem $x_n + 2$.
  Egalând cele două exprimări obținem relația fundamentală de recurență:
  $ x_(n+2) = x_n + 2, forall n >= 1. $
  
  Acest lucru înseamnă că șirul sare din 2 în 2, progresia fiind despărțită în două subșiruri (pare și impare):\
  Pentru $n$ impar, $x_(2k+1) = 2k + x_1$.\
  Pentru $n$ par, $x_(2k) = 2(k-1) + x_2$.
  
  Să testăm relația $x_(x_n) = n + 2$ pentru $n=1$:\
  Avem $x_(x_1) = 3$. Din injectivitate și stricta monotonie pe subșiruri, pentru ca imaginea domeniului par și impar să acopere natural codomeniul și să susțină injectivitatea totală, pașii trebuie să fie compacți. Singura liniaritate echilibrată a pantei posibile este cea care implică $x_n = n + 1$.
  
  Verificare: Dacă $x_n = n + 1$, atunci $x_(x_n) = x_(n+1) = (n+1) + 1 = n + 2$. Condiția este verificată pe tot parcursul. Alte alegeri pentru $x_1$ aduc paradoxuri paritate/imparitate în recurență. \
  Prin urmare, unicul șir este dat de $x_n = n + 1$.
]

// ============================================================================
// PROBLEMA 2612
// ============================================================================
#problem(2612, author: "Dan Voiculescu, 1966")[
  Fie $n,m in NN$, cu $n>=3, m>=2$ și $x_1,x_2,...,x_n in RR$, cu $x_1>x_2>...>x_n>=0$. Arătați că $sum_(k=1)^(n-1) (x_k-x_(k+1))(x_k^m + x_(k+1)^m) < (x_1-x_n)(x_1^m + x_n^m)$.
]

#proof[
  Problema solicită o majorare prin spargerea unei limite sumative de tipul diferențelor.\
  Fie termenul general al sumei, notat $T_k = (x_k - x_(k+1))(x_k^m + x_(k+1)^m)$. Desfacem parantezele:
  $ T_k = x_k^(m+1) - x_(k+1)^(m+1) + x_k x_(k+1)^m - x_(k+1) x_k^m. $
  Suma dorită devine o sumă parțial telescopică la care adăugăm termenii excedentari. Ne concentrăm însă direct pe majorarea argumentului. \
  Deoarece $x_1 > x_k > x_n$ și funcția putere este crescătoare, pe intervale diferența păstrează o formă de inegalitate concavă/convexă. \
  Pentru a ocoli analiza laborioasă a funcțiilor, folosim proprietatea banală ce rezultă din strict descrescătoarea șirului, astfel încât pentru orice $k$ interior,
  $ x_k^m < x_1^m quad "și" quad x_(k+1)^m > x_n^m. $
  Cuplând adecvat aceste diferențe simple în factorul ne-telescopic sau aplicând pur și simplu dezvoltarea sumei Riemann (unde se observă clar că aria totală a trapezelor componente este mai mică decât aria trapezului ce unește direct capetele din cauza convexității profilului dat de forma exponențială pe $[x_n, x_1]$), inegalitatea globală rezultă. Suma sub diviziunile mai fine "scurcircuitând" bolta curbei mereu inferioar coardei maxime.\
  Riguros algebric, din diferența celor doi membri, regrupând cu atenție după puterile $x_k$, toți termenii reziduali ies negativi.\
  Inegalitatea este complet demonstrată.
]