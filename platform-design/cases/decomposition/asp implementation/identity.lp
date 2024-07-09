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

% 0{option(1);option(2);option(3);option(4)}4 :- options.
% 1{percondition(X,P1,P2):person(P1),person(P2)}1 :- option(X).

% -option(X) :- not option(X), X=1..4.
% 1{-percondition(X,P1,P2):person(P1),person(P2)}1 :- -option(X).

% 3{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}3              :- percondition(1,P1,P2).
% 3{same_hometown(P1, P2); identity_match(P1, doctor); identity_match(P2, lawyer)}3       :- percondition(2,P1,P2). 
% 3{elder(P1, P2); identity_match(P1, doctor); identity_match(P2, writer)}3               :- percondition(3,P1,P2). 
% 3{different_hometown(P1, P2); identity_match(P1, lawyer); identity_match(P2, teacher)}3 :- percondition(4,P1,P2). 
% 3{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}3 :- percondition(4,P1,P2). 

% answer(a):- elder(P1, P2)               , identity_match(P1, writer), identity_match(P2, teacher)    , person(P1), person(P2).
% answer(b):- same_hometown(P1, P2)       , identity_match(P1, doctor), identity_match(P2, lawyer)     , person(P1), person(P2). 
% answer(c):- elder(P1, P2)               , identity_match(P1, doctor), identity_match(P2, writer)     , person(P1), person(P2). 
% answer(d):- different_hometown(P1, P2)  , identity_match(P1, lawyer), identity_match(P2, teacher)    , person(P1), person(P2). 

1{percondition(X,P1,P2):person(P1),person(P2)}1 :- option(X).

-option(1) :- option(1).
1{-percondition(1,P1,P2):person(P1),person(P2)}1 :- -option(1).

3{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}3 :- percondition(1,P1,P2).
0{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}2 :- -percondition(1,P1,P2).


% answer(a):- 3{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}3              , person(P1), person(P2).
% answer(b):- 3{same_hometown(P1, P2); identity_match(P1, doctor); identity_match(P2, lawyer)}3       , person(P1), person(P2). 
% answer(c):- 3{elder(P1, P2); identity_match(P1, doctor); identity_match(P2, writer)}3               , person(P1), person(P2). 
% answer(d):- 3{different_hometown(P1, P2); identity_match(P1, lawyer); identity_match(P2, teacher)}3 , person(P1), person(P2). 

% 0{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}2              :- -percondition(1,P1,P2).
% 0{same_hometown(P1, P2); identity_match(P1, doctor); identity_match(P2, lawyer)}2       :- -percondition(2,P1,P2). 
% 0{elder(P1, P2); identity_match(P1, doctor); identity_match(P2, writer)}2               :- -percondition(3,P1,P2). 
% 0{different_hometown(P1, P2); identity_match(P1, lawyer); identity_match(P2, teacher)}2 :- -percondition(4,P1,P2). 

% THAT'S HORRIBLE
% 5{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher);person(P1);person(P2)}5 :- answer(a).
% 5{same_hometown(P1, P2); identity_match(P1, doctor); identity_match(P2, lawyer);person(P1);person(P2)}5 :- answer(b). 
% 5{elder(P1, P2); identity_match(P1, doctor); identity_match(P2, writer);person(P1);person(P2)}5 :- answer(c). 
% 5{different_hometown(P1, P2); identity_match(P1, lawyer); identity_match(P2, teacher);person(P1);person(P2)}5 :- answer(d). 

% 3{elder(P1, P2); identity_match(P1, writer); identity_match(P2, teacher)}3 :- option(1),person(P1),person(P2),P1!=P2.
% 3{same_hometown(P1, P2); identity_match(P1, doctor); identity_match(P2, lawyer)}3 :- option(2),person(P1),person(P2),P1!=P2. 
% 3{elder(P1, P2); identity_match(P1, doctor); identity_match(P2, writer)}3 :- option(3),person(P1),person(P2),P1!=P2. 
% 3{different_hometown(P1, P2); identity_match(P1, lawyer); identity_match(P2, teacher)}3 :- option(4),person(P1),person(P2),P1!=P2. 

% elder(P1, P2)               :- option(1),person(P1),person(P2),P1!=P2,identity_match(P1, writer), identity_match(P2, teacher).
% same_hometown(P1, P2)       :- option(2),person(P1),person(P2),P1!=P2,identity_match(P1, doctor), identity_match(P2, lawyer). 
% elder(P1, P2)               :- option(3),person(P1),person(P2),P1!=P2,identity_match(P1, doctor), identity_match(P2, writer). 
% different_hometown(P1, P2)  :- option(4),person(P1),person(P2),P1!=P2,identity_match(P1, lawyer), identity_match(P2, teacher).

% elder(P1, P2)               :- option(1),identity_match(P1, writer), identity_match(P2, teacher).
% same_hometown(P1, P2)       :- option(2),identity_match(P1, doctor), identity_match(P2, lawyer). 
% elder(P1, P2)               :- option(3),identity_match(P1, doctor), identity_match(P2, writer). 
% different_hometown(P1, P2)  :- option(4),identity_match(P1, lawyer), identity_match(P2, teacher).


5{situation(1..5)}5 :- rule.

1{elder(a, P) : identity_match(P, teacher)}1 :- situation(1).
1{different_hometown(b, P) : identity_match(P, lawyer)}1 :- situation(2).
1{same_hometown(c, P) : identity_match(P, writer)}1 :- situation(3).
1{smaller(P, b) : identity_match(P, writer)}1 :- situation(4).
1{same_hometown(b, P) : identity_match(P, teacher)}1 :- situation(5).

% #show identity_match/2.
% #show same_hometown/2.
% #show -same_hometown/2.
% #show different_hometown/2.
% #show -different_hometown/2.
% #show unknown_hometown/2.
% #show elder/2.
% #show -elder/2.
% #show smaller/2.
% #show -smaller/2.
% #show unknown_age/2.
% #show option/1.
% #show percondition/3.
% #show -option/1.
#show answer/1.


% original solution

% elder(a, P) :- person(P), identity_match(P, teacher).
% different_hometown(b, P) :- person(P), identity_match(P, lawyer).
% same_hometown(c, P) :- person(P), identity_match(P, writer).
% smaller(P, b) :- person(P), identity_match(P, writer).
% same_hometown(b, P) :- person(P), identity_match(P, teacher).

% answer(a) :- elder(P1, P2), identity_match(P1, writer), identity_match(P2, teacher).
% answer(b) :- same_hometown(P1, P2), identity_match(P1, doctor), identity_match(P2, lawyer).
% answer(c) :- elder(P1, P2), identity_match(P1, doctor), identity_match(P2, writer).
% answer(d) :- different_hometown(P1, P2), identity_match(P1, lawyer), identity_match(P2, teacher). 
