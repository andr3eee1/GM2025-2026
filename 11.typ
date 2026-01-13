#import "@local/my-math:0.1.0": *

#show: project.with(
  title: "Rezolvari gazeta matematica 11",
  author: "Andrei Pana",
  date: datetime.today().display()
)

// ============================================================================
// PROBLEMA 29239
// ============================================================================
#problem(29239, author: "Dragoș-Alexandru Badea")[
  Rezolvați în $RR$ ecuația $x^2 + floor(x)^2 + {x}^2 = 2$
]

#proof[
  Fie $k = floor(x)$ și $alpha = {x}$\
  Ecuația devine:
  $ (k+alpha)^2 + k^2 + alpha^2 = 2 $
  $ k^2 + alpha^2 + 2k alpha + k^2 + alpha^2 = 2 $
  $ 2(k^2 + alpha^2 + k alpha) = 2 $
  $ k^2 + alpha^2 + k alpha = 1 $
  O scriem ca ecuație de gradul 2 în $k$:
  $ k^2 + k alpha + (alpha^2 - 1) = 0 $
  $ Delta = alpha^2 - 4 dot 1 dot (alpha^2 - 1) = alpha^2 - 4alpha^2 + 4 = 4 - 3alpha^2 $
  Deci soluțiile sunt:
  $ k_(1,2) = (-alpha plus.minus sqrt(4-3alpha^2))/2 in ZZ $
  Deci $4-3alpha^2 = p^2, space p in ZZ$\
  Dar $0 <= alpha < 1 => 0 <= alpha^2 < 1 => 0 >= -alpha^2 > 1 => 0 >= -3alpha^2 > 3 => 4 >= 4-3alpha^2 > 3 => 4-3alpha^2 = 4 => underline(alpha = 0) => x=k$

  Deci ecuația inițiala devine:
  $ x^2 + x^2 + 0 = 2 => 2x^2 = 2 => #rect[x = $plus.minus 1$] $
]

// ============================================================================
// PROBLEMA 29240
// ============================================================================
#problem(29240, author: "Traian Preda")[
  Fie patrulaterul $A B C D$, punctul $O$ de intersecție a diagonalelor sale și $G_1, G_2, G_3$ centrele de greutate ale triunghiurilor $A B D, A B C, "respectiv" O D C$. Demonstrați că $O$ este centrul de greutate al triunghiului $G_1 G_2 G_3$ dacă și numai dacă $A B C D$ este paralelogram.
]

#proof[
  Fie patrulaterul $A B C D$, punctul $O$ de intersecție a diagonalelor sale și $G_1, G_2, G_3$ centrele de greutate ale triunghiurilor $A B D, A B C$, respectiv $O D C$. Demonstrați că $O$ este centrul de greutate al triunghiului $G_1 G_2 G_3$ dacă și numai dacă $A B C D$ este paralelogram.

== Demonstrație

Vom utiliza *calculul vectorial* raportat la punctul $O$ (intersecția diagonalelor).

1. *Ipoteză și notații:*
  Fie $O$ originea reperului, deci $arrow(r_O) = 0$

2. *Exprimarea centrelor de greutate:*
  Centrul de greutate este media aritmetică a vectorilor de poziție ai vârfurilor:
  $ arrow(r_G_1) &= (arrow(r_A) + arrow(r_B) + arrow(r_D)) / 3 \
    arrow(r_G_2) &= (arrow(r_A) + arrow(r_B) + arrow(r_C)) / 3 \
    arrow(r_G_3) &= (arrow(r_O) + arrow(r_D) + arrow(r_C)) / 3 $

3. *Condiția problemei:*
  $O$ este centrul de greutate al $triangle G_1 G_2 G_3$ dacă și numai dacă suma vectorilor de poziție este nulă (deoarece originea este în $O$):
  $ (arrow(r_G_1) + arrow(r_G_2) + arrow(r_G_3)) / 3 = arrow(r_O) <=> arrow(r_G_1) + arrow(r_G_2) + arrow(r_G_3) = 3arrow(r_O) $

  Înlocuind expresiile de la pasul 2:
  $ (arrow(r_A) + arrow(r_B) + arrow(r_D))/3 + (arrow(r_A) + arrow(r_B) + arrow(r_C))/3 + (arrow(r_D) + arrow(r_C) + arrow(r_O))/3 = 3arrow(r_O) $

  Înmulțim cu 3 și grupăm termenii:
  $ (2arrow(r_A) + 2arrow(r_B) + 2arrow(r_C) + 2arrow(r_D)) + arrow(r_O) = 9arrow(r_O) $
  $ arrow(r_A) + arrow(r_B) + arrow(r_C) + arrow(r_D) = 4arrow(r_O) $
  $ arrow(O A) + arrow(O B) + arrow(O C) + arrow(O D) = arrow(0) quad quad (ast) $

4. *Echivalența cu paralelogramul:*
  Deoarece $A, O, C$ sunt coliniare și $B, O, D$ sunt coliniare, există scalarii $alpha, beta$ astfel încât $arrow(O C) = alpha arrow(O A)$ și $arrow(O D) = beta arrow(O B)$.
  
  Rescriem ecuația $(ast)$:
  $ arrow(O A) + arrow(O B) + alpha arrow(O A) + beta arrow(O B) = 0 \
    (1 + alpha) arrow(O A) + (1 + beta) arrow(O B) = 0 $
  
  Deoarece $arrow(O A)$ și $arrow(O B)$ sunt vectori liniar independenți (punctele $A, O, B$ nu sunt coliniare în patrulater convex), coeficienții trebuie să fie nuli:
  $ cases(1 + alpha = 0, 1 + beta = 0) => cases(alpha = -1, beta = -1) $
  
  Aceasta implică $arrow(O C) = -arrow(O A)$ și $arrow(O D) = -arrow(O B)$, adică $O$ este mijlocul segmentelor $[A C]$ și $[B D]$.
  
  *Concluzie:* Diagonalele se înjumătățesc reciproc, deci $A B C D$ este paralelogram.
]

// ============================================================================
// PROBLEMA 29241
// ============================================================================
#problem(29241, author: "Gheorghe Crăciun")[
  Determinați numerele reale $a, b, c, d$ știind că
  $ a + b + c + d = 2a^2 + 3b^2 + 9c^2 + 18d^2 = 1 $
]

#proof[
  Aplicăm inegalitatea Cauchy-Bunyakovsky-Schwarz (CBS) sub forma algebraică:
  $ (u_1^2 + u_2^2 + u_3^2 + u_4^2)(v_1^2 + v_2^2 + v_3^2 + v_4^2) >= (u_1 v_1 + u_2 v_2 + u_3 v_3 + u_4 v_4)^2 $

  Alegem termenii astfel încât să potrivim coeficienții din enunț:
  $ u_1 = a sqrt(2), quad u_2 = b sqrt(3), quad u_3 = 3c, quad u_4 = d sqrt(18) $
  $ v_1 = 1/sqrt(2), quad v_2 = 1/sqrt(3), quad v_3 = 1/3, quad v_4 = 1/sqrt(18) $

  Calculăm suma pătratelor termenilor $v_k$:
  $ v_1^2 + v_2^2 + v_3^2 + v_4^2 = 1/2 + 1/3 + 1/9 + 1/18 $
  Aducem la numitorul comun $18$:
  $ (9 + 6 + 2 + 1) / 18 = 18/18 = 1 $

  Înlocuim în inegalitatea CBS:
  $ (2a^2 + 3b^2 + 9c^2 + 18d^2) dot 1 >= (a sqrt(2) dot 1/sqrt(2) + b sqrt(3) dot 1/sqrt(3) + 3c dot 1/3 + d sqrt(18) dot 1/sqrt(18))^2 $

  Simplificând, obținem:
  $ (2a^2 + 3b^2 + 9c^2 + 18d^2) >= (a + b + c + d)^2 $

  Folosind datele din ipoteză (unde ambele sume sunt egale cu $1$), relația devine:
  $ 1 >= 1^2 => 1 >= 1 $

  Deoarece avem egalitate în CBS, termenii $u_k$ și $v_k$ trebuie să fie proporționali:
  $ (a sqrt(2)) / (1/sqrt(2)) = (b sqrt(3)) / (1/sqrt(3)) = (3c) / (1/3) = (d sqrt(18)) / (1/sqrt(18)) = k $

  Efectuând împărțirile, obținem relațiile simple:
  $ 2a = 3b = 9c = 18d = k $

  Exprimăm variabilele în funcție de $k$:
  $ a = k/2, quad b = k/3, quad c = k/9, quad d = k/18 $

  Înlocuim în suma $a + b + c + d = 1$ pentru a afla $k$:
  $ k/2 + k/3 + k/9 + k/18 = 1 $
  $ k (1/2 + 1/3 + 1/9 + 1/18) = 1 $
  $ k dot 1 = 1 => k = 1 $

  Așadar, soluția este:
  $ a = 1/2, quad b = 1/3, quad c = 1/9, quad d = 1/18 $
]

// ============================================================================
// PROBLEMA 29242
// ============================================================================
#problem(29242, author: "Cosmin Manea și Dragoș Petrică")[
  Fie $a, b in NN^*$ și ecuația
  $ (a+b)x^2 - (a+b)^2x + a^2 + b^2 + a b - 1 = 0. $
  a) Arătați că ecuația are soluții reale.\
  b) Determinați $a$ și $b$ știind că ecuația admite o soluție întreagă.
]

#proof[
  Considerăm funcția de gradul al doilea atașată ecuației, $f: RR -> RR$:
  $ f(x) = (a+b)x^2 - (a+b)^2x + a^2 + b^2 + a b - 1 $

  *a) Demonstrarea existenței soluțiilor reale*
  
  Calculăm valoarea funcției în punctul $x = 1$:
  $ f(1) = (a+b) dot 1^2 - (a+b)^2 dot 1 + a^2 + b^2 + a b - 1 $
  $ f(1) = a + b - (a^2 + 2a b + b^2) + a^2 + b^2 + a b - 1 $
  Reducem termenii asemenea:
  $ f(1) = a + b - a^2 - 2a b - b^2 + a^2 + b^2 + a b - 1 $
  $ f(1) = a + b - a b - 1 $
  Factorizăm expresia:
  $ f(1) = a(1 - b) - (1 - b) = (a - 1)(1 - b) = -(a - 1)(b - 1) $

  Deoarece $a, b in NN^*$, avem $a >= 1$ și $b >= 1$, ceea ce implică $(a-1) >= 0$ și $(b-1) >= 0$.
  Prin urmare, $f(1) = -(a-1)(b-1) <= 0$.

  Deoarece coeficientul lui $x^2$ este $a+b > 0$, parabola este convexă, iar vârful acesteia are ordonata mai mică sau egală cu $f(1)$. Cum $f(1) <= 0$, graficul funcției intersectează axa $O x$, deci ecuația are soluții reale $x_1, x_2$.

  *b) Determinarea numerelor $a$ și $b$*
  Știm că ecuația are cel puțin o soluție întreagă. Din relațiile lui Viète:
  $ x_1 + x_2 = (a+b)^2 / (a+b) = a + b $
  Deoarece suma rădăcinilor ($a+b$) este număr întreg și una dintre rădăcini este întreagă, rezultă obligatoriu că și a doua rădăcină este număr întreg.
  
  De asemenea, produsul rădăcinilor este:
  $ x_1 x_2 = (a^2 + b^2 + a b - 1) / (a+b) $
  Deoarece $a, b >= 1$, numărătorul și numitorul sunt pozitivi, deci $x_1, x_2 > 0$. Fiind întregi și strict pozitivi, avem $x_1 >= 1$ și $x_2 >= 1$.

  Calculăm valoarea expresiei $(x_1 - 1)(x_2 - 1)$:
  $ (x_1 - 1)(x_2 - 1) = x_1 x_2 - (x_1 + x_2) + 1 $
  
  Înlocuim sumele și produsele cu valorile în funcție de $a$ și $b$:
  $ (x_1 - 1)(x_2 - 1) = (a^2 + b^2 + a b - 1)/(a+b) - (a+b) + 1 $
  
  Aducem la același numitor:
  $ (x_1 - 1)(x_2 - 1) = (a^2 + b^2 + a b - 1 - (a+b)^2 + (a+b)) / (a+b) $
  
  Dezvoltăm $(a+b)^2 = a^2 + 2a b + b^2$ la numărător:
  $ "Numărător" = a^2 + b^2 + a b - 1 - a^2 - 2a b - b^2 + a + b $
  $ "Numărător" = -a b + a + b - 1 $
  $ "Numărător" = -(a-1)(b-1) $

  Așadar, obținem egalitatea fundamentală:
  $ (x_1 - 1)(x_2 - 1) = - ((a-1)(b-1)) / (a+b) $

  Analizăm semnele celor doi membri:
  1. În membrul stâng: Deoarece $x_1, x_2 >= 1$ (demonstrat mai sus), avem $(x_1 - 1) >= 0$ și $(x_2 - 1) >= 0$. Deci produsul lor este $>= 0$.
  2. În membrul drept: Deoarece $a, b >= 1$, avem $(a-1) >= 0$ și $(b-1) >= 0$, iar $a+b > 0$. Din cauza semnului minus din față, toată fracția este $<= 0$.

  Singura posibilitate ca un număr pozitiv sau nul să fie egal cu un număr negativ sau nul este ca ambele să fie egale cu *zero*.
  
  Rezultă:
  $ (a-1)(b-1) = 0 $
  Aceasta implică $a - 1 = 0$ sau $b - 1 = 0$, deci $a = 1$ sau $b = 1$.

  *Concluzie:* Soluțiile sunt perechile $(1, n)$ sau $(n, 1)$ cu $n in NN^*$.
]

// ============================================================================
// PROBLEMA 29243
// ============================================================================
#problem(29243, author: "Nicolae Bourbăcuț")[
  Determinați valorile lui $t in RR$ știind că, pentru orice $a, b, c >= 0$,
  $ t a b c + (1-t)(a^3+b^3+c^3)/3 >= ((a+b+c)/3)^3. $
]

#proof[
  Vom demonstra că inegalitatea are loc dacă și numai dacă $t <= 5/9$.

  *1. Condiția necesară (Determinarea valorii limită)*
  Testăm inegalitatea pentru valori particulare ale variabilelor pentru a găsi o limitare a lui $t$.
  Fie $a = 1, b = 1, c = 0$.
  Înlocuim în relația dată:
  $ t dot 0 + (1-t) (1^3 + 1^3 + 0^3)/3 >= ((1+1+0)/3)^3 $
  $ 0 + (1-t) dot 2/3 >= (2/3)^3 $
  $ 2/3 (1-t) >= 8/27 $
  Înmulțim cu $3/2$:
  $ 1-t >= 4/9 => t <= 1 - 4/9 => t <= 5/9 $
  
  Deci, o condiție necesară este $t <= 5/9$. Vom arăta că este și suficientă.

  *2. Condiția suficientă (Demonstrația folosind Schur)*
  Considerăm cazul limită $t = 5/9$. Inegalitatea devine:
  $ 5/9 a b c + (1 - 5/9) (a^3+b^3+c^3)/3 >= ((a+b+c)/3)^3 $
  $ 5/9 a b c + 4/27 (a^3+b^3+c^3) >= (a+b+c)^3 / 27 $
  
  Înmulțim întreaga relație cu $27$ pentru a elimina numitorii:
  $ 15 a b c + 4(a^3+b^3+c^3) >= (a+b+c)^3 $

  Ne folosim de identitatea algebrică pentru cubul sumei:
  $ (a+b+c)^3 = a^3+b^3+c^3 + 3(a+b)(b+c)(c+a) $
  Sau, scrisă sub formă desfășurată utilă pentru Schur:
  $ (a+b+c)^3 = sum a^3 + 3sum_(s y m) a^2b + 6a b c $
  (unde $sum_(s y m) a^2b = a^2b + a b^2 + b^2c + b c^2 + c^2a + c a^2$)

  Inegalitatea de demonstrat devine:
  $ 15a b c + 4sum a^3 >= sum a^3 + 3sum_(s y m) a^2b + 6a b c $
  Reducem termenii asemenea:
  $ 3sum a^3 + 9a b c >= 3sum_(s y m) a^2b $
  Împărțim prin 3:
  $ sum a^3 + 3a b c >= sum_(s y m) a^2b $
  $ a^3 + b^3 + c^3 + 3a b c >= a b(a+b) + b c(b+c) + c a(c+a) $

  Aceasta este exact *Inegalitatea lui Schur* de gradul 1, care este adevărată pentru orice $a, b, c >= 0$.
  Astfel, inegalitatea din enunț este adevărată pentru $t = 5/9$.

  *3. Extinderea pentru $t < 5/9$*
  Rescriem inegalitatea inițială sub forma:
  $ t (a b c - (a^3+b^3+c^3)/3) + (a^3+b^3+c^3)/3 >= ((a+b+c)/3)^3 $
  
  Conform inegalității mediilor (sau simplu AM-GM aplicat pentru cuburi), știm că:
  $ (a^3+b^3+c^3)/3 >= root(3, a^3 b^3 c^3) = a b c $
  Deci coeficientul lui $t$, adică $(a b c - (a^3+b^3+c^3)/3)$, este mai mic sau egal cu zero.
  
  Dacă notăm $E(t)$ membrul stâng al inegalității, funcția $f(t) = E(t)$ este descrescătoare (sau constantă) în raport cu $t$.
  Deoarece am demonstrat că inegalitatea este valabilă pentru $t = 5/9$, ea va fi valabilă pentru orice $t < 5/9$.

  *Concluzie:* Valorile căutate sunt $t in (-oo, 5/9]$.
]

// ============================================================================
// PROBLEMA 29244
// ============================================================================
#problem(29244, author: "Liliana Niculescu")[
  Fie $A B C$ un triunghi și punctele $M in (B C), N in (C A) "și" P in (A B)$. Știind că triunghiurile $A B C$ și $M N P$ au același ortocentru și cercurile lor circumscrise sunt concentrice, arătați că $A B C$ este echilateral.
]

#proof[
  NU INCA! TODO
]

// ============================================================================
// PROBLEMA 29245
// ============================================================================
#problem(29245, author: "***")[
  a) Determinați $a, b in QQ_+^*$ pentru care $a + b in ZZ$ și $1/a + 1/b in ZZ$.\
  b) Arătați că există o infinitate de triplete $(a, b, c)$ de numere raționale pozitive pentru care $a + b + c in ZZ$ și $1/a + 1/b + 1/c in ZZ$.
]

#proof[
  *a) Determinarea valorilor $a, b in QQ_+^*$*

  Fie $a + b = n in ZZ^+$ și $1/a + 1/b = k in ZZ^+$. Din a doua relație obținem:
  $ (a+b)/(a b) = k => n/(a b) = k => a b = n/k $

  Considerăm ecuația de gradul al doilea ale cărei rădăcini sunt $a$ și $b$:
  $ x^2 - n x + n/k = 0 <=> k x^2 - n k x + n = 0 $

  Pentru ca $a, b$ să fie numere raționale, discriminantul $Delta$ trebuie să fie un pătrat perfect al unui număr rațional (și fiind întreg, trebuie să fie pătrat perfect în $ZZ$):
  $ Delta = (n k)^2 - 4 n k $

  Notăm $u = n k$. Avem condiția $u^2 - 4u = m^2$ cu $m in ZZ$.
  Această ecuație se poate scrie sub forma:
  $ (u - 2)^2 - m^2 = 4 <=> (u - 2 - m)(u - 2 + m) = 4 $

  Deoarece $u, m in ZZ$, parantezele trebuie să fie divizori ai lui $4$ cu aceeași paritate. Avem următoarele cazuri pentru $(u-2-m, u-2+m)$:
  1. $(-2, -2) => u - 2 = -2 => u = 0$, imposibil deoarece $a, b > 0$.
  2. $(2, 2) => u - 2 = 2 => u = 4$.

  Dacă $u = n k = 4$, atunci $Delta = 0$, deci $a = b = (n k) / (2 k) = n/2$.
  Din $n k = 4$ cu $n, k in ZZ^+$, avem perechile $(n, k) in {(1, 4), (2, 2), (4, 1)}$.
  - Pentru $(1, 4) => a = b = 1/2$.
  - Pentru $(2, 2) => a = b = 1$.
  - Pentru $(4, 1) => a = b = 2$.

  Deci, soluțiile sunt $(a, b) in {(1/2, 1/2), (1, 1), (2, 2)}$.
  \
  \
  \
  \

  *b) Demonstrarea existenței unei infinități de triplete*

  Căutăm o familie de soluții de forma:
  $ a = (p+q)/p, quad b = (p+q)/q, quad c = 1/(p q) $
  unde $p, q in ZZ^+$ sunt parametri întregi.

  Verificăm condiția pentru $1/a + 1/b + 1/c$:
  $ 1/a + 1/b + 1/c = p/(p+q) + q/(p+q) + p q = (p+q)/(p+q) + p q = 1 + p q in ZZ $

  Verificăm condiția pentru $a + b + c$:
  $ a + b + c = (p+q)/p + (p+q)/q + 1/(p q) = (q(p+q) + p(p+q) + 1)/(p q) = (p^2 + 2p q + q^2 + 1)/(p q) $
  $ a + b + c = (p^2 + q^2 + 1)/(p q) + 2 $

  Pentru ca $a+b+c$ să fie întreg, trebuie ca $p q | p^2 + q^2 + 1$. Considerăm cazul $p^2 + q^2 + 1 = 3 p q$.
  $ p^2 + 3p q + q^2 +1 = 0 $
  Dacă $(p, q)$ este o soluție, atunci fixând $q$, ecuația $x^2 - (3q)x + (q^2+1) = 0$ este o ecuație de gradul 2 în $x$.\
  Din relațiile lui Viete, dacă $p$ este o rădăcină, a doua rădăcină $p prime$ satisface: $p + p prime = 3q => p prime = 3q - p$. Astfel, din perechea $(p, q)$ putem genera o pereche nouă $(q, 3q-p)$.

  Pornind de la $(1, 1)$:
  - $(1, 2) => a=3, b=3/2, c=1/2 => a+b+c=5, 1/a+1/b+1/c=3$
  - $(2, 5) => a=7/2, b=7/5, c=1/10 => a+b+c=5, 1/a+1/b+1/c=11$
  - $(5, 13) => a=18/5, b=18/13, c=1/65 => a+b+c=5, 1/a+1/b+1/c=66$

  Deoarece șirul de perechi $(p_n, q_n)$ este infinit și strict crescător, rezultă existența unei infinități de triplete $(a, b, c) in QQ_+^(*3)$ care satisfac ipoteza.
]