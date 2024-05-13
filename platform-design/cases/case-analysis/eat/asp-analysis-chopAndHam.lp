% person(a).
% person(b).
% person(c).
% food(ham).
% food(pork).
% day(yes).
% day(tod).

% 1{eat(P, F, D):food(F)}1 :- person(P), day(D).
% both(P) :- person(P), eat(P, ham, yes), eat(P, pork, tod).

% :- eat(a, ham, D), not eat(b, pork, D), day(D).
% :- not eat(a, ham, D), not eat(c, ham, D), day(D).
% :- eat(a, ham, D), eat(c, ham, D), day(D).
% :- eat(b, pork, D), eat(c, pork, D), day(D).
% :- 0{both(P):person(P)}0.

% % #show eat/3.
% #show both/1.


% ---------------------------------------

% rule(eitherOr).
% rule(neitherNor).
% rule(ifThen).
% rule(not_).
% rule(bothAnd).
% rule(nStatementsTrue).
% rule(allStatementsTrue).
% rule(noStatementTrue).

% reason(X, Y, eitherOr) :-     p(X), not p(Y), X!=Y, r(X), r(Y).
% reason(X, Y, eitherOr) :- not p(X),     p(Y), X!=Y, r(X), r(Y).

% reason(X, Y, ifThen)   :-     p(X),     p(Y), X!=Y, r(X), r(Y).
% reason(X, Y, ifThen)   :- not p(X),           X!=Y, r(X), r(Y).

% reason(X, Y, bothAnd)  :-     p(X),     p(Y), X!=Y, r(X), r(Y).

% person(a).
% person(b).
% person(c).
% food(ham).
% food(pork).
% day(yes).
% day(tod).

% % #const n=10.
% % r(1..n).

% 1{eat(P, F, D):food(F)}1 :- person(P), day(D).

% p(1) :- eat(a, ham, D), eat(b, pork, D), day(D).
% p(1) :- not eat(a, ham, D), eat(b, F, D), day(D).
% 如何让上下的D是同一个呢？

% p(2) :- eat(a, ham, D), not eat(c, ham, D), day(D).
% p(2) :- not eat(a, ham, D), eat(c, ham, D), day(D).

% p(3) :- not eat(b, ham, D), eat(c, F, D), day(D).
% p(3) :- not eat(c, ham, D), eat(b, F, D), day(D).

% % 3{p(1;2;3)}3.

% % :- not p(1..3).


% % 1{answer(P):person(P)}1.
% :- 0{answer(P):person(P)}0.

% answer(P) :- person(P), eat(P, ham, yes), eat(P, pork, tod).

% #show eat/3.
% #show p/1.
% #show answer/1.

% -------------------------------------------------------
% person(a).
% person(b).
% person(c).
% food(ham).
% food(pork).
% day(yes).
% day(tod).

% 1{eat(P, F, D):food(F)}1 :- person(P), day(D).

% p(2) :- eat(a, ham, D), not eat(c, ham, D), day(D).
% p(2) :- not eat(a, ham, D), eat(c, ham, D), day(D).

% #show eat/3.
% #show p/1.

% -------------------------------------------------------
% person(a).
% person(b).
% person(c).
% food(ham).
% food(pork).
% day(yes).
% day(tod).

% 1{eat(P, F, D):food(F)}1 :- person(P), day(D).
% % 1{answer(P)} :- person(P), eat(P, ham, yes), eat(P, pork, tod).
% answer(P) :- person(P), eat(P, ham, yes), eat(P, pork, tod).


% -p(1) :- eat(a, ham, D), not eat(b, pork, D), day(D).
% -p(2) :- not eat(a, ham, D), not eat(c, ham, D), day(D).
% -p(2) :- eat(a, ham, D), eat(c, ham, D), day(D).
% -p(3) :- eat(b, pork, D), eat(c, pork, D), day(D).

% 3{p(1;2;3)}3.
% :- 0{answer(P):person(P)}0.

% % #show eat/3.
% % #show p/1.
% #show answer/1.

% -------------------------------------------------------
person(a).
person(b).
person(c).
food(ham).
food(pork).
day(yes).
day(tod).

% #const n=10.
% r(1..n).

1{eat(P, F, D):food(F)}1 :- person(P), day(D).

p(1, D) :- eat(a, ham, D), eat(b, pork, D), day(D).
p(1, D) :- not eat(a, ham, D), eat(b, F, D), day(D).
-p(1):- not p(1, D), day(D).

p(2, D) :- eat(a, ham, D), not eat(c, ham, D), day(D).
p(2, D) :- not eat(a, ham, D), eat(c, ham, D), day(D).
-p(2):- not p(2, D), day(D).

p(3, D) :- not eat(b, pork, D), day(D).
p(3, D) :- not eat(c, pork, D), day(D).
-p(3):- not p(3, D), day(D).


3{p(1;2;3)}3.

% 1{answer(P):person(P)}1.
:- 0{answer(P):person(P)}0.

answer(P) :- person(P), eat(P, ham, yes), eat(P, pork, tod).

#show eat/3.
% #show p/1.
#show p/2.
#show answer/1.

% -------------------------------------------------------

p(X, D) :- reason(p(A, D), p(B, D), eitherOr), day(D).
reason(p(A, D), p(B, D), eitherOr) :-    p(A, D), not p(B, D), A!=B, r(A), r(B), day(D).