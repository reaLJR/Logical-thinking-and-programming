# 分解法
## 思路
answer分解为每个选项的条件，选项条件成立时，判断是否满足题目的规则限制

answer(B) -> conclusion & rule

rule -> answer sets * 4

![alt text](assets/decomposition/image.png)

---

a ham yes & pork tod -> whether rules satisfied

if answer a then aa

aa: if conclusion then rule 

## 案例
### 火腿/猪排
阿德里安、布福德和卡特三人去餐馆吃饭，他们每人要的不是火腿就是猪排。

（1）	如果阿德里安要的是火腿，那么布福德 要的就是猪排。

（2）	阿德里安或卡特要的是火腿，但是不会两人都要火腿。

（3）	布福德和卡特不会两人都要猪排。

谁昨天要的是火腿，今天要的是猪排？

```
person(a).
person(b).
person(c).
food(ham).
food(pork).
day(yes).
day(tod).
1{eat(P, F, D):food(F)}1 :- person(P), day(D).

answer.

1{answer(P) : person(P)}3 :- answer.

3{eat(P, ham, yes); eat(P, pork, tod); p}3 :- person(P), answer(P).

6{p(1, yes); p(2, yes);p(3, yes); p(1, tod);p(2, tod);p(3, tod)}6 :- p.

2{eat(a,ham,D);eat(b,pork,D)}2:-p(11,D),day(D).
not eat(a,ham,D):-p(12,D),day(D).
1{p(11,D);p(12,D)}1:-p(1,D).
1{eat(a,ham,D);eat(c,ham,D)}1:-p(2,D).
0{eat(b,pork,D);eat(c,pork,D)}1:-p(3,D),day(D).

#show answer/1.
```