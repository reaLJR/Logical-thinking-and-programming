person(a).
person(b).
person(c).
food(ham).
food(pork).
day(yes).
day(tod).

1{eat(P, F, D):food(F)}1 :- person(P), day(D).

2{eat(a,ham,D);eat(b,pork,D)}2:-p(11,D),day(D).
not eat(a,ham,D):-p(12,D),day(D).
1{p(11,D);p(12,D)}1:-p(1,D).
1{eat(a,ham,D);eat(c,ham,D)}1:-p(2,D).
0{eat(b,pork,D);eat(c,pork,D)}1:-p(3,D),day(D).


6{p(1, yes); p(2, yes);p(3, yes);p(1, tod);p(2, tod);p(3, tod)}6 :- p.

p.

% % p :- p(1, yes), p(2, yes), p(3, yes), p(1, tod), p(2, tod), p(3, tod).


% % :- 0{answer(P):person(P)}0.

% % answer(P) :- person(P), eat(P, ham, yes), eat(P, pork, tod), p.
% % answer(P) :- person(P), eat(P, ham, yes), eat(P, pork, tod).
% 3{eat(P, ham, yes); eat(P, pork, tod); p}3 :- person(P), answer(P).

% 1{answer(P) : person(P)}3 :- answer.

% answer.
% % answer(P) :- person(P). 

#show eat/3.
% #show p/1.
% #show p/2.
% #show answer/1.