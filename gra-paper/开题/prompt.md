

这是一道逻辑编程题目。
要求：
1.我需要你对选项中的文本做语义分析，并且提取出选项中的实体及其关系，并表示为asp谓词的形式。
2.只对选项文本进行实体提取即可，不要分析题目，不要进行解答。
3.你的功能是帮助我进行选项中实体和关系的提取，不要进行解答，不要分析题干。

阿德里安、布福德和卡特三人去餐馆吃饭，他们每人要的不是火腿就是猪排。

（1） 如果阿德里安要的是火腿，那么布福德要的就是猪排。

（2） 阿德里安或卡特要的是火腿，但是不会两人都要火腿。

（3） 布福德和卡特不会两人都要猪排。

谁昨天要的是火腿，今天要的是猪排？

以下是一个示例：
示例题目：
甲、乙、丙、丁4人参加预选赛。对于预选赛结果,几位教练预测如下:
(1)如果甲、乙均未通过，则丙通过
(2)如果乙、丙至少有1人通过，则丁也通过
(3)如果甲、乙至少有1人通过，则丙也通过，但是丁不通过。
根据几位教练的预测，可以推出:
A．丙和丁通过
B．甲和丁通过
C.甲和乙通过
D．乙和丙通过



示例输出，包含两个部分：
person(a;b;c;d). 第一部分，表示实体包含甲乙丙丁四个人
join(X). 第二部分，这是一个一元函数，表示实体的属性或关系，在该题目中为属性join，即该人是否通过。