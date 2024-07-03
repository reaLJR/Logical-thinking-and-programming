person(l;z;g;d;w;s).

answer.

2{options; rule}2 :- answer.

2{pre; ops}2 :- options.

0{join(s)}0 :- pre.

1{option(a;b;c;d)}1 :- ops.

3{join(l;g;d)}3 :- option(a).
3{join(z;g;d)}3 :- option(b).
3{join(z;d;w)}3 :- option(c).
3{join(l;d;w)}3 :- option(d).

5{p(1;2;3;4;5)}5 :- rule.

1{join(l;z)}1 :- p(1).
1{p(21;22)}1 :- p(2).
2{join(w;l)}2 :- p(21).
not join(l) :- p(22).
1{p(31;32)}1 :- p(3).
3{join(g;w;s)}3 :- p(31).
0{join(g;w)}1 :- p(32).
1{not join(d); join(g)}1 :- p(4).
1{join(s;d)}1 :- p(5).

-join(X) :- not join(X), person(X).

#show join/1.
#show -join/1.