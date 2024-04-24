% fact
person(z).
person(w).
person(l).
person(zhao).
person(q).

% RIGHT
% p(z) :- shoot(z), not shoot(l).
% p(z) :- not shoot(z), shoot(l).
% p(w) :- not shoot(q).
% p(l) :- shoot(zhao).
% p(l) :- not shoot(zhao), shoot(w).
% p(zhao) :- not shoot(zhao), not shoot(w).
% p(q) :- not shoot(l), not shoot(z).

% 1{shoot(X) : person(X)}1.
% 2{p(X) : person(X)}2.

% #show p/1.
% #show shoot/1.

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

rule(eitherOr).
rule(neitherNor).
rule(ifThen).
rule(not_).

r(r1;r2;r3;r4;r5;r6;r7;r8).
% r(r1;r2).

1{shoot(X) : person(X)}1.

reason(X, Y, eitherOr) :-     p(X), not p(Y), X!=Y, r(X), r(Y).
reason(X, Y, eitherOr) :- not p(X),     p(Y), X!=Y, r(X), r(Y).

reason(X, Y, ifThen)   :-     p(X),     p(Y), X!=Y, r(X), r(Y).
reason(X, Y, ifThen)   :- not p(X),           X!=Y, r(X), r(Y).

p(z) :- reason(r1, r2, eitherOr).
p(r1) :- shoot(z).
p(r2) :- shoot(l).

p(w) :- not shoot(q).

p(l) :- reason(r3, r4, ifThen).
p(r3) :- not shoot(zhao).
p(r4) :- shoot(w).

p(zhao) :- reason(r5, r6, eitherOr).
p(r5) :- not shoot(zhao).
p(r6) :- not shoot(w).

p(q) :- reason(r7, r8, eitherOr).
p(r7) :- not shoot(l).
p(r8) :- not shoot(z).

% shoot(X) :- person(X).

% 1{shoot(X) : person(X)}1.
2{p(X) : person(X)}2.

answer(X) :- p(X), person(X).

% #show answer/1.
#show p/1.
#show shoot/1.
#show reason/3.