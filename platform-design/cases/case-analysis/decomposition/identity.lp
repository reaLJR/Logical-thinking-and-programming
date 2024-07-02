person(a;b;c;d).
identity(teacher;doctor;writer;lawyer).

:- identity_match(a,teacher).
:- identity_match(b,lawyer). 
:- identity_match(c,writer). 
:- identity_match(b,writer). 
:- identity_match(a,lawyer). 
:- identity_match(b,teacher).

same_hometown(P1, P2) :- person(P1), person(P2), -different_hometown(P1, P2), P1 != P2.
different_hometown(P1, P2) :- person(P1), person(P2), -same_hometown(P1, P2), P1 != P2.
-same_hometown(P1, P2) :- person(P1), person(P2), different_hometown(P1, P2), P1 != P2.
-different_hometown(P1, P2) :- person(P1), person(P2), same_hometown(P1, P2), P1 != P2.
same_hometown(P1, P2) :- person(P1), person(P2), person(P3), same_hometown(P1, P3), same_hometown(P2, P3), P1 != P2.
unknown_hometown(P1, P2) :- person(P1), person(P2), not same_hometown(P1, P2), not different_hometown(P1, P2), P1 != P2.

elder(P1, P2) :- person(P1), person(P2), -smaller(P1, P2), P1 != P2.
smaller(P1, P2) :- person(P1), person(P2), -elder(P1, P2), P1 != P2.
-elder(P1, P2) :- person(P1), person(P2), smaller(P1, P2), P1 != P2.
-smaller(P1, P2) :- person(P1), person(P2), elder(P1, P2), P1 != P2.
elder(P1, P2) :- person(P1), person(P2), smaller(P2, P1), P1 != P2.
smaller(P1, P2) :- person(P1), person(P2), elder(P2, P1), P1 != P2.
elder(P1, P2) :- person(P1), person(P2), person(P3), elder(P1, P3), elder(P2, P3), P1 != P2.
smaller(P1, P2) :- person(P1), person(P2), person(P3), smaller(P1, P3), smaller(P2, P3), P1 != P2.
unknown_age(P1, P2) :- person(P1), person(P2), not elder(P1, P2), not smaller(P1, P2), P1 != P2.

1{identity_match(P, I) : identity(I)}1 :- person(P).
:- identity_match(P1, I), identity_match(P2, I), P1 != P2.

elder(a, P) :- person(P), identity_match(P, teacher).
different_hometown(b, P) :- person(P), identity_match(P, lawyer).
same_hometown(c, P) :- person(P), identity_match(P, writer).
smaller(P, b) :- person(P), identity_match(P, writer).
same_hometown(b, P) :- person(P), identity_match(P, teacher).

answer(a) :- elder(P1, P2), identity_match(P1, writer), identity_match(P2, teacher).
answer(b) :- same_hometown(P1, P2), identity_match(P1, doctor), identity_match(P2, lawyer).
answer(c) :- elder(P1, P2), identity_match(P1, doctor), identity_match(P2, writer).
answer(d) :- different_hometown(P1, P2), identity_match(P1, lawyer), identity_match(P2, teacher). 

#show identity_match/2.
#show same_hometown/2.
#show -same_hometown/2.
#show different_hometown/2.
#show -different_hometown/2.
#show unknown_hometown/2.
#show elder/2.
#show -elder/2.
#show smaller/2.
#show -smaller/2.
#show unknown_age/2.

#show answer/1.