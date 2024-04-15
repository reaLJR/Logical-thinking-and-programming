person(a).
person(b).
person(c).
food(ham).
food(chop).
day(yes).
day(tod).

1{eat(P, F, D):food(F)}1 :- person(P), day(D).
both(P) :- person(P), eat(P, ham, yes), eat(P, chop, tod).

:- eat(a, ham, D), not eat(b, chop, D), day(D).
:- not eat(a, ham, D), not eat(c, ham, D), day(D).
:- eat(a, ham, D), eat(c, ham, D), day(D).
:- eat(b, chop, D), eat(c, chop, D), day(D).
:- 0{both(P):person(P)}0.

#show eat/3.
#show both/1.
