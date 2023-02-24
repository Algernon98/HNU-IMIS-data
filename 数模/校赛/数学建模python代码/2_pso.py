# -*- coding: utf-8 -*-
def demo_func(x):
    x1, x2, x3 = x
    return x1 ** 2 + (x2 - 0.05) ** 2 + x3 ** 2


# %% Anaconda Prompt中安装第三方库
# pip install scikit-opt
from sko.PSO import PSO
import funs

# pso = PSO(func=demo_func, dim=3, pop=40, max_iter=150, lb=[0, -1, 0.5], ub=[1, 1, 1], w=0.8, c1=0.5, c2=0.5)
# 通过更改数字来选择进行求解最值的函数 注:5个函数均能在所定义的范围通过粒子群算法找到最值点
fun = funs.fitness5
lbs = [-500,-500,-500] # funs.fit1_lb
ubs = [500,500,500] #funs.fit1_ub
pso = PSO(func=fun, dim=3, pop=400, max_iter=500, lb=lbs, ub=ubs, w=0.95, c1=0.5, c2=0.8)
pso.run()
print('best_x is ', pso.gbest_x, '\n best_y is', pso.gbest_y)

# %% Plot the result
import matplotlib.pyplot as plt

plt.plot(pso.gbest_y_hist)
plt.show()
