% fact
person(z).
person(w).
person(l).
person(zhao).
person(q).

% RIGHT
p(z) :- shoot(z), not shoot(l).
p(z) :- not shoot(z), shoot(l).
p(w) :- not shoot(q).
p(l) :- shoot(zhao).
p(l) :- not shoot(zhao), shoot(w).
p(zhao) :- not shoot(zhao), not shoot(w).
p(q) :- not shoot(l), not shoot(z).

1{shoot(X) : person(X)}1.
2{p(X) : person(X)}2.

#show p/1.
#show shoot/1.

% -------------------------------------------------------------

% WRONG
% % p(z, C) :- shoot(z), not shoot(l), condition(C), condition(C0), C != C0, not p(z, C0).
% % p(z, C) :- not shoot(z), shoot(l), condition(C), condition(C0), C != C0, not p(z, C0).
% p(z, C) :- shoot(z), not shoot(l), condition(C).
% p(z, C) :- not shoot(z), shoot(l), condition(C).
% p(w, C) :- not shoot(q), condition(C).
% % p(l, C) :- shoot(zhao), condition(C), condition(C0), C != C0, not p(l, C0).
% % p(l, C) :- not shoot(zhao), shoot(w), condition(C), condition(C0), C != C0, not p(l, C0).
% p(l, C) :- shoot(zhao), condition(C).
% p(l, C) :- not shoot(zhao), shoot(w), condition(C).
% p(zhao, C) :- not shoot(zhao), not shoot(w), condition(C).
% p(q,C) :- not shoot(l), not shoot(z), condition(C).

% 1{p(P, C): condition(C)}1 :- person(P).
% 2{p(P, true): person(P)}2.
% 1{shoot(X) : person(X)}1.


% #show p/2.
% #show shoot/1.

% -------------------------------------------------------------

% rule(eitherOr).
% rule(neitherNor).
% rule(ifThen).
% rule(not_).

% r(r1;r2;r3;r4;r5;r6;r7;r8).

% 1{shoot(X) : person(X)}1.

% reason(X, Y, eitherOr) :-     p(X), not p(Y), X!=Y, r(X), r(Y).
% reason(X, Y, eitherOr) :- not p(X),     p(Y), X!=Y, r(X), r(Y).

% reason(X, Y, ifThen)   :-     p(X),     p(Y), X!=Y, r(X), r(Y).
% reason(X, Y, ifThen)   :- not p(X),           X!=Y, r(X), r(Y).

% p(z) :- reason(r1, r2, eitherOr).
% p(r1) :- shoot(z).
% p(r2) :- shoot(l).

% p(w) :- not shoot(q).

% p(l) :- reason(r3, r4, ifThen).
% p(r3) :- not shoot(zhao).
% p(r4) :- shoot(w).

% p(zhao) :- reason(r5, r6, eitherOr).
% p(r5) :- not shoot(zhao).
% p(r6) :- not shoot(w).

% p(q) :- reason(r7, r8, eitherOr).
% p(r7) :- not shoot(l).
% p(r8) :- not shoot(z).

% % shoot(X) :- person(X).

% 2{p(X) : person(X)}2.

% answer(X) :- p(X), person(X).

% % #show answer/1.
% #show p/1.
% #show shoot/1.
% % #show reason/3.

% -------------------------------------------------------------

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

% % reason(N, nStatementsTrue) :- N{p(X) : person(X)}N, N=2.

% % reason(N, nStatementsTrue) :- N{p(X) }N, person(X), N=2.

% father(X) :- person(X).
% r(X) :- person(X).
% r(1..8).

% 1{shoot(X) : person(X)}1.

% % p(king) :- reason(2,nStatementsTrue).
% p(king) :- 2{p(X) : person(X)}2.

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

% % 2{p(X) : person(X)}2.

% answer(X) :- p(X), person(X).

% :- not p(king).

% % #show answer/1.
% #show p/1.
% #show shoot/1.
% % #show true.
% % #show reason/3.

% -------------------------------------------------------------

% rule(eitherOr).
% rule(neitherNor).
% rule(ifThen).
% rule(not_).

% r(r1;r2;r3;r4;r5;r6;r7;r8;r9).

% 1{shoot(X) : person(X)}1.

% % reason(X, Y, eitherOr) :-     p(X), not p(Y), X!=Y, r(X), r(Y).
% % reason(X, Y, eitherOr) :- not p(X),     p(Y), X!=Y, r(X), r(Y).

% % reason(X, Y, ifThen)   :-     p(X),     p(Y), X!=Y, r(X), r(Y).
% % reason(X, Y, ifThen)   :- not p(X),           X!=Y, r(X), r(Y).

% % reason(r1, r2, eitherOr) :-     p(r1), not p(r2).
% % reason(r1, r2, eitherOr) :- not p(r1),     p(r2).

% % reason(r5, r6, eitherOr) :-     p(r5), not p(r6).
% % reason(r5, r6, eitherOr) :- not p(r5),     p(r6).    

% % reason(r7, r8, eitherOr) :-     p(r7), not p(r8).
% % reason(r7, r8, eitherOr) :- not p(r7),     p(r8).

% % reason(r3, r4, ifThen)   :-     p(r3),     p(r4).
% % reason(r3, r4, ifThen)   :- not p(r3)           .

% p(z) :- reason(r1, r2, eitherOr).
% p(r1) :- shoot(z).
% p(r2) :- shoot(l).

% p(w) :- p(r9).
% p(r9) :- not shoot(q).
% % p(w) :- not shoot(q).

% p(l) :- reason(r3, r4, ifThen).
% p(r3) :- not shoot(zhao).
% p(r4) :- shoot(w).

% p(zhao) :- reason(r5, r6, eitherOr).
% p(r5) :- not shoot(zhao).
% p(r6) :- not shoot(w).

% p(q) :- reason(r7, r8, eitherOr).
% p(r7) :- not shoot(l).
% p(r8) :- not shoot(z).

% 2{p(X) : person(X)}2.
% % 3{p(X) : person(X)}3.

% answer(X) :- p(X), person(X).

% #show answer/1.
% #show p/1.
% #show shoot/1.
% #show reason/3.

% -------------------------------------------------------------

% rule(eitherOr).
% rule(neitherNor).
% rule(ifThen).
% rule(not_).

% r(r1;r2;r3;r4;r5;r6;r7;r8;r9).

% 1{shoot(X) : person(X)}1.

% % reason(X, Y, eitherOr) :-     p(X), not p(Y), X!=Y, r(X), r(Y).
% % reason(X, Y, eitherOr) :- not p(X),     p(Y), X!=Y, r(X), r(Y).

% % reason(X, Y, ifThen)   :-     p(X),     p(Y), X!=Y, r(X), r(Y).
% % reason(X, Y, ifThen)   :- not p(X),           X!=Y, r(X), r(Y).

% % reason(r1, r2, eitherOr) :-     p(r1), not p(r2).
% % reason(r1, r2, eitherOr) :- not p(r1),     p(r2).

% % reason(r5, r6, eitherOr) :-     p(r5), not p(r6).
% % reason(r5, r6, eitherOr) :- not p(r5),     p(r6).    

% % reason(r7, r8, eitherOr) :-     p(r7), not p(r8).
% % reason(r7, r8, eitherOr) :- not p(r7),     p(r8).

% % reason(r3, r4, ifThen)   :-     p(r3),     p(r4).
% % reason(r3, r4, ifThen)   :- not p(r3)           .

% p(z) :- p(r1), not p(r2).
% p(z) :- p(r2), not p(r1).
% p(r1) :- shoot(z).
% p(r2) :- shoot(l).

% p(w) :- p(r9).
% p(r9) :- not shoot(q).
% % p(w) :- not shoot(q).

% p(l) :- p(r3), p(r4).
% p(l) :- not p(r3).
% p(r3) :- not shoot(zhao).
% p(r4) :- shoot(w).

% p(zhao) :- p(r5), p(r6).
% p(r5) :- not shoot(zhao).
% p(r6) :- not shoot(w).

% p(q) :- p(r7), p(r8).
% p(r7) :- not shoot(l).
% p(r8) :- not shoot(z).

% % 1{p(X) : person(X)}1.
% 2{p(X) : person(X)}2.
% % 3{p(X) : person(X)}3.

% answer(X) :- p(X), person(X).
% sub(X) :- p(X), not person(X).

% #show answer/1.
% % #show p/1.
% #show sub/1.
% #show shoot/1.
% % #show reason/3.

% -------------------------------------------------------------


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

% % reason(N, nStatementsTrue) :- N{p(X) : person(X)}N, N=2.

% % reason(N, nStatementsTrue) :- N{p(X) }N, person(X), N=2.

% % father(X) :- person(X).
% r(X) :- person(X).
% r(1..8).
% r(shootz;shootl;shootw;shootq;shootzhao).

% % 1{shoot(X) : person(X)}1.
% 1{p(shootz);p(shootl);p(shootw);p(shootq);p(shootzhao)}1.

% % p(king) :- reason(2,nStatementsTrue).
% p(king) :- 2{p(z);p(w);p(l);p(zhao);p(q)}2.

% p(z) :- reason(1, 2, eitherOr).
% p(1) :- p(shootz).
% p(2) :- p(shootl).

% p(w) :- not p(shootq).

% p(l) :- reason(3, 4, ifThen).
% p(3) :- not p(shootzhao).
% p(4) :- p(shootw).

% p(zhao) :- reason(5, 6, bothAnd).
% p(5) :- not p(shootzhao).
% p(6) :- not p(shootw).

% p(q) :- reason(7, 8, bothAnd).
% p(7) :- not p(shootl).
% p(8) :- not p(shootz).

% % 2{p(X) : person(X)}2.

% answer(X) :- p(X), person(X).

% :- not p(king).

% #show answer/1.
% #show p/1.
% % #show shoot/1.
% % #show true.
% % #show reason/3.