from graphviz import Digraph
import os
# 获取当前脚本文件的目录路径
current_dir = os.path.dirname(os.path.abspath(__file__))

# 创建 'graphs' 文件夹(如果不存在)
graphs_dir = os.path.join(current_dir, 'graphs')
os.makedirs(graphs_dir, exist_ok=True)

# 设置文件路径
filename = os.path.join(graphs_dir, 'chopAndHam')

# f = Digraph('finite_state_machine', filename=filename)
# f.attr(rankdir='LR', size='20,5')
# f.attr('node', shape='doublecircle')
# f.node('LR_0')
# f.node('LR_3')
# f.node('LR_4')
# f.node('LR_8')
# f.attr('node', shape='circle')
# f.edge('LR_0', 'LR_2', label='SS(B)')
# f.edge('LR_0', 'LR_1', label='SS(S)')
# f.edge('LR_1', 'LR_3', label='S($end)')
# f.edge('LR_2', 'LR_6', label='SS(b)')
# f.edge('LR_2', 'LR_5', label='SS(a)')
# f.edge('LR_2', 'LR_4', label='S(A)')
# f.edge('LR_5', 'LR_7', label='S(b)')
# f.edge('LR_5', 'LR_5', label='S(a)')
# f.edge('LR_6', 'LR_6', label='S(b)')
# f.edge('LR_6', 'LR_5', label='S(a)')
# f.edge('LR_7', 'LR_8', label='S(b)')
# f.edge('LR_7', 'LR_5', label='S(a)')
# f.edge('LR_8', 'LR_6', label='S(b)')
# f.edge('LR_8', 'LR_5', label='S(a)')
# f.view()

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


# g.view()
g.render()