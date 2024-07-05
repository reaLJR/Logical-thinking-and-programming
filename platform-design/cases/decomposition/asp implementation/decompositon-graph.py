from graphviz import Digraph
import os
# 获取当前脚本文件的目录路径
current_dir = os.path.dirname(os.path.abspath(__file__))

# 创建 'graphs' 文件夹(如果不存在)
graphs_dir = os.path.join(current_dir, 'graphs')
os.makedirs(graphs_dir, exist_ok=True)

# 设置文件路径
filename = os.path.join(graphs_dir, 'chopAndHam')

g = Digraph('Tree', filename=filename, node_attr={'shape': 'rectangle'})

g.node('answer', 'answer')

# 创建 answer(a) 分支
with g.subgraph(name='cluster_a') as a:
    a.attr(style='invisible')  # 设置簇的边框为"invisible"
    a.node('a', 'answer(a)')
    with a.subgraph(name='cluster_a1') as a1:
        a1.attr(style='invisible')  # 设置簇的边框为"invisible"
        a1.node('a11', 'eat(a, ham, yes)')
        a1.node('a12', 'eat(a, pork, tod)')
        a1.node('a13', 'p')
        with a1.subgraph(name='cluster_a13') as a13:
            a13.attr(style='invisible')  # 设置簇的边框为"invisible"
            a13.node('a131', 'p1')
            with a13.subgraph(name='cluster_a131') as a131:
                a131.attr(style='invisible')  # 设置簇的边框为"invisible"
                a131.node('a1311', 'today')
                a131.node('a1312', 'if eat(a, ham, tod) then eat(b, pork, tod)')
            a13.node('a132', 'p2')
            a13.node('a133', 'p3')

# 创建 answer(b) 分支
with g.subgraph(name='cluster_b') as b:
    b.attr(style='invisible')  # 设置簇的边框为"invisible"
    b.node('b', 'answer(b)')

# 创建 answer(c) 分支
with g.subgraph(name='cluster_c') as c:
    c.attr(style='invisible')  # 设置簇的边框为"invisible"
    c.node('c', 'answer(c)')

# 连接节点
g.edges([
    ('answer', 'a'), ('answer', 'b'), ('answer', 'c'),
    ('a', 'a11'), ('a', 'a12'), ('a', 'a13'),
    ('a13', 'a131'), ('a131', 'a1311'), ('a131', 'a1312'),
    ('a13', 'a132'), ('a13', 'a133')
])

g.render()


filename = os.path.join(graphs_dir, 'chopAndHam.gv')

g = Digraph('Tree', filename=filename, node_attr={'shape': 'rectangle'})

g.node('answer', 'answer')

# 创建 answer(a) 分支
with g.subgraph(name='cluster_a') as a:
    a.attr(style='invisible')
    a.node('a', 'answer(a)')
    with a.subgraph(name='cluster_a1') as a1:
        a1.attr(style='invisible')
        a1.node('a11', 'eat(a, ham, yes)')
        a1.node('a12', 'eat(a, pork, tod)')

# 创建 answer(b) 分支
with g.subgraph(name='cluster_b') as b:
    b.attr(style='invisible')
    b.node('b', 'answer(b)')

# 创建 answer(c) 分支
with g.subgraph(name='cluster_c') as c:
    c.attr(style='invisible')
    c.node('c', 'answer(c)')

# 创建 规则 分支
with g.subgraph(name='cluster_rules') as rules:
    rules.attr(style='invisible')
    with rules.subgraph(name='cluster_set1') as set1:
        set1.attr(style='invisible')
        set1.node('set1', '结果集1')
        set1.edges([
            ('set1', 'c_ham_tod'), ('set1', 'c_ham_yes'), ('set1', 'a_pork_yes'),
            ('set1', 'b_ham_yes'), ('set1', 'a_pork_tod'), ('set1', 'b_ham_tod')
        ])
    with rules.subgraph(name='cluster_set2') as set2:
        set2.attr(style='invisible')
        set2.node('set2', '结果集2')
        set2.edges([
            ('set2', 'b_pork_yes'), ('set2', 'c_ham_tod'), ('set2', 'c_ham_yes'),
            ('set2', 'a_pork_yes'), ('set2', 'a_pork_tod'), ('set2', 'b_ham_tod')
        ])
    with rules.subgraph(name='cluster_set3') as set3:
        set3.attr(style='invisible')
        set3.node('set3', '结果集....')

# 连接节点
g.edges([
    ('answer', 'a'), ('answer', 'b'), ('answer', 'c'),
    ('a', 'a11'), ('a', 'a12'),
    ('cluster_rules', 'cluster_set1'), ('cluster_rules', 'cluster_set2'), ('cluster_rules', 'cluster_set3')
])

# 设置节点名称
g.node('c_ham_tod', 'eat(c,ham,tod)')
g.node('c_ham_yes', 'eat(c,ham,yes)')
g.node('a_pork_yes', 'eat(a,pork,yes)')
g.node('b_ham_yes', 'eat(b,ham,yes)')
g.node('a_pork_tod', 'eat(a,pork,tod)')
g.node('b_ham_tod', 'eat(b,ham,tod)')
g.node('b_pork_yes', 'eat(b,pork,yes)')

g.render()