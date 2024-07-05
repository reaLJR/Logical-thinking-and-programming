person(z).
person(w).
person(l).
person(zhao).
person(q).

answer.

2{options; rule}2 :- answer.


1{shoot(X):person(X)}1 :- options.

% 1{shoot(X) : person(X)}1.
% 2{p(X) : person(X)}2.
% 3{-p(X) : person(X)}3.
-p(X) :- not p(X), person(X).
2{p(z;w;l;zhao;q)}2 :- rule.
% :- #count{p(z;w;l;zhao;q)} != 2.

% 1{shoot(z); shoot(l)}1      :- not -p(z).
% not shoot(q)                :- not -p(w).
% 1{shoot(zhao); shoot(w)}1   :- not -p(l).
% 0{shoot(zhao); shoot(w)}0   :- not -p(zhao).
% 0{shoot(l); shoot(z)}0      :- not -p(q).

1{shoot(z); shoot(l)}1      :- p(z).
not shoot(q)                :- p(w).
1{shoot(zhao); shoot(w)}1   :- p(l).
0{shoot(zhao); shoot(w)}0   :- p(zhao).
0{shoot(l); shoot(z)}0      :- p(q).

0{shoot(z); shoot(l)}0      :- -p(z).
shoot(q)                    :- -p(w).
0{shoot(zhao); shoot(w)}0   :- -p(l).
1{shoot(zhao); shoot(w)}1   :- -p(zhao).
1{shoot(l); shoot(z)}1      :- -p(q).

% p(z) :- shoot(z), not shoot(l).
% p(z) :- not shoot(z), shoot(l).
% p(w) :- not shoot(q).
% p(l) :- shoot(zhao).
% p(l) :- not shoot(zhao), shoot(w).
% p(zhao) :- not shoot(zhao), not shoot(w).
% p(q) :- not shoot(l), not shoot(z).


#show p/1.
#show shoot/1.

% Answer: 1
% p(z) p(w) shoot(z)
% Answer: 2
% p(z) p(zhao) shoot(z)
% Answer: 3
% p(z) p(w) shoot(l)
% Answer: 4
% p(z) p(zhao) shoot(l)
% Answer: 5
% p(w) p(q) shoot(w)
% Answer: 6
% p(w) p(l) shoot(w)
% Answer: 7
% p(w) p(q) shoot(zhao)
% Answer: 8
% p(w) p(l) shoot(zhao)
% Answer: 9
% p(l) p(q) shoot(w)
% Answer: 10
% p(l) p(q) shoot(zhao)
% Answer: 11
% p(zhao) p(q) shoot(q)
% Answer: 12
% p(w) p(zhao) shoot(z)
% Answer: 13
% p(w) p(zhao) shoot(l)
