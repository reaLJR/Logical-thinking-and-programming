person(a;b;c;d).

answer.

2{options; rule}2 :- answer.

1{option(a;b;c;d)}1 :- options.

2{join(c;d)}2 :- option(a).
2{join(d;a)}2 :- option(b).
2{join(a;b)}2 :- option(c).
2{join(c;b)}2 :- option(d).

3{p(1;2;3)}3 :- rule.

1{p(11;12)}1 :- p(1).
3{not join(a);not join(b);join(c)}3 :- p(11).
0{not join(a);not join(b)}1 :- p(12).

1{p(21;22)}1 :- p(2).
2{borc; join(d)}2:- p(21).
1{join(b;c)}2 :- borc.
0{join(b;c)}0 :- p(22).

1{p(31;32)}1 :- p(3).
3{aorb; join(c); not join(d)}3:- p(31).
1{join(a;b)}2 :- aorb.
0{join(a;b)}0 :- p(32).

#show join/1.
#show option/1.