person(a;b;c;d).
identity(teacher;doctor;writer;lawyer).

:- identity_match(a,teacher).
:- identity_match(b,lawyer). 
:- identity_match(c,writer). 
:- identity_match(b,writer). 
:- identity_match(a,lawyer). 
:- identity_match(b,teacher).

same_hometown(P1, P2)       :- person(P1), person(P2), -different_hometown(P1, P2), P1 != P2.
different_hometown(P1, P2)  :- person(P1), person(P2), -same_hometown(P1, P2), P1 != P2.
different_hometown(P1, P2)  :- person(P1), person(P2), different_hometown(P2, P1), P1 != P2.
-same_hometown(P1, P2)      :- person(P1), person(P2), different_hometown(P1, P2), P1 != P2.
-different_hometown(P1, P2) :- person(P1), person(P2), same_hometown(P1, P2), P1 != P2.
% -same_hometown(P1, P2)      :- person(P1), person(P2), unknown_hometown(P1, P2), P1 != P2.
% -different_hometown(P1, P2) :- person(P1), person(P2), unknown_hometown(P1, P2), P1 != P2.
same_hometown(P1, P2)       :- person(P1), person(P2), person(P3), same_hometown(P1, P3), same_hometown(P2, P3), P1 != P2.
same_hometown(P1, P2)       :- person(P1), person(P2), same_hometown(P2, P1), P1 != P2.
unknown_hometown(P1, P2)    :- person(P1), person(P2), not same_hometown(P1, P2), not different_hometown(P1, P2), P1 != P2.

elder(P1, P2)       :- person(P1), person(P2), -smaller(P1, P2), P1 != P2.
smaller(P1, P2)     :- person(P1), person(P2), -elder(P1, P2), P1 != P2.
-elder(P1, P2)      :- person(P1), person(P2), smaller(P1, P2), P1 != P2.
-smaller(P1, P2)    :- person(P1), person(P2), elder(P1, P2), P1 != P2.
elder(P1, P2)       :- person(P1), person(P2), smaller(P2, P1), P1 != P2.
smaller(P1, P2)     :- person(P1), person(P2), elder(P2, P1), P1 != P2.
elder(P1, P2)       :- person(P1), person(P2), person(P3), elder(P1, P3), elder(P2, P3), P1 != P2.
smaller(P1, P2)     :- person(P1), person(P2), person(P3), smaller(P1, P3), smaller(P2, P3), P1 != P2.
unknown_age(P1, P2) :- person(P1), person(P2), not elder(P1, P2), not smaller(P1, P2), P1 != P2.

1{identity_match(P, I) : identity(I)}1 :- person(P).
:- identity_match(P1, I), identity_match(P2, I), P1 != P2.



answer.

2{options; rule}2 :- answer.


0{option(1);option(2);option(3);option(4)}4 :- options.
-option(X) :- not option(X), X=1..4.

1{percondition(X,P1,P2):person(P1),person(P2)}1 :- option(X).
1{-percondition(X,P1,P2):person(P1),person(P2)}1 :- -option(X).


3{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}3 :- percondition(1,P1,P2).
3{not elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}3 :- -percondition(1,P1,P2).

3{same_hometown(P1, P2); identity_match(P1, doctor); identity_match(P2, lawyer)}3 :- percondition(2,P1,P2).
3{not same_hometown(P1, P2); identity_match(P1, doctor); identity_match(P2, lawyer)}3 :- -percondition(2,P1,P2).

3{elder(P1, P2); identity_match(P1, doctor); identity_match(P2, writer)}3 :- percondition(3,P1,P2).
3{not elder(P1, P2); identity_match(P1, doctor); identity_match(P2, writer)}3 :- -percondition(3,P1,P2).

3{different_hometown(P1, P2); identity_match(P1, teacher); identity_match(P2, lawyer)}3 :- percondition(4,P1,P2).
3{not different_hometown(P1, P2); identity_match(P1, teacher); identity_match(P2, lawyer)}3 :- -percondition(4,P1,P2).



5{situation(1..5)}5 :- rule.

1{elder(a, P) : identity_match(P, teacher)}1 :- situation(1).
1{different_hometown(b, P) : identity_match(P, lawyer)}1 :- situation(2).
1{same_hometown(c, P) : identity_match(P, writer)}1 :- situation(3).
1{smaller(P, b) : identity_match(P, writer)}1 :- situation(4).
1{same_hometown(b, P) : identity_match(P, teacher)}1 :- situation(5).

#show option/1.