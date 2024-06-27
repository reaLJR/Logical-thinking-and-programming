person(a).
person(b).
person(c).
food(ham).
food(pork).
day(yes).
day(tod).

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


% 3{p(1;2;3)}3.

p :- p(1), p(2), p(3).


% :- 0{answer(P):person(P)}0.

answer(P) :- person(P), eat(P, ham, yes), eat(P, pork, tod), p.

% #show eat/3.
% % #show p/1.
% #show p/2.
#show answer/1.