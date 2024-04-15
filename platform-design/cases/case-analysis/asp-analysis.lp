% fact
person(z).
person(w).
person(l).
person(zhao).
person(q).
condition(true;false).


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