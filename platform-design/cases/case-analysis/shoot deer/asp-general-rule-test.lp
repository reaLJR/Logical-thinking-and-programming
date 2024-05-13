% person(z).
% person(w).
% person(l).
% person(zhao).
% person(q).

% rule(eitherOr).
% rule(neitherNor).
% rule(ifThen).
% rule(not_).
% rule(bothAnd).

% reason(X, Y, eitherOr) :-     p(X), not p(Y), X!=Y, r(X), r(Y).
% reason(X, Y, eitherOr) :- not p(X),     p(Y), X!=Y, r(X), r(Y).

% reason(X, Y, ifThen)   :-     p(X),     p(Y), X!=Y, r(X), r(Y).
% reason(X, Y, ifThen)   :- not p(X),           X!=Y, r(X), r(Y).

% reason(X, Y, bothAnd)  :-     p(X),     p(Y), X!=Y, r(X), r(Y).

% r(1..8).

% p(z) :- reason(1, 2, eitherOr).
% p(1) :- shoot(z).
% p(2) :- shoot(l).

% p(w) :- not shoot(q).

% p(l) :- reason(3, 4, ifThen).
% p(3) :- not shoot(zhao).
% p(4) :- shoot(w).

% p(zhao) :- reason(5, 6, bothAnd).
% p(5) :- not shoot(zhao).
% p(6) :- not shoot(w).

% p(q) :- reason(7, 8, bothAnd).
% p(7) :- not shoot(l).
% p(8) :- not shoot(z).

% 1{shoot(X) : person(X)}1.
% 2{p(X) : person(X)}2.

% #show p/1.
% #show shoot/1.


rule(eitherOr).
rule(neitherNor).
rule(ifThen).
rule(not_).
rule(bothAnd).
rule(nStatementsTrue).
rule(allStatementsTrue).
rule(noStatementTrue).

reason(X, Y, eitherOr) :-     p(X), not p(Y), X!=Y, r(X), r(Y).
reason(X, Y, eitherOr) :- not p(X),     p(Y), X!=Y, r(X), r(Y).

reason(X, Y, ifThen)   :-     p(X),     p(Y), X!=Y, r(X), r(Y).
reason(X, Y, ifThen)   :- not p(X),           X!=Y, r(X), r(Y).

reason(X, Y, bothAnd)  :-     p(X),     p(Y), X!=Y, r(X), r(Y).

