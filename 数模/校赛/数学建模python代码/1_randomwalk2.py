# -*- coding: utf-8 -*-
'''
@Description:改进的随机游走算法

即使迭代次数N=100不大，
初始点(−100,−10)离最优点(50,50)非常远，
改进的随机游走算法依然可以达到最优点。
'''
from __future__ import print_function
import math
import random
# import numpy as np

N = 100  # 迭代次数100
step = 20.0  # 初始步长10.0
epsilon = 0.000001
variables = 2  # 变量数目

# 初始点坐标
x = [0, 0]  # 适用于fun1的起始点 成功
# x = [10, 10]  # 适用于fun2的起始点 成功
# x = [10, 10]  # 适用于fun3的起始点 失败
# x = [10, 10]  # 适用于fun4的起始点 成功
# x = [350,350]  # 适用于fun5的起始点 成功

walk_num = 1  # 初始化随机游走次数
n = 10  # 每次随机生成向量u的数目
print("迭代次数:", N)
print("初始步长:", step)
print("每次产生随机向量数目:", n)
print("epsilon:", epsilon)
print("变量数目:", variables)
print("初始点坐标:", x)


# 定义目标函数

def function(x):
    # fun1
    r = math.sqrt((x[0] - 50) ** 2 + (x[1] - 50) ** 2) + math.e
    f = math.sin(r) / r + 1
    return -1 * f


# def function(x):
#     #fun2
#     Z = (x[1]-51*(x[0]**2)/(40*np.pi**2)+5*x[0]/np.pi-6)**2 + 10*(1-1/(8*np.pi))*np.cos(x[0])+10
#     return Z

# def function(x):
#     #fun3
#     Z = (x[0]/4000+x[1]**2/4000)-np.cos(x[0])*np.cos(x[1]/np.sqrt(2))+1
#     return Z

# def function(x):
#    #fun4
#    Z = -np.cos(x[0]) * np.cos(x[1]) * np.exp(-((x[0]-np.pi)**2 + (x[1]-np.pi)**2))
#    return Z

# def function(x):
#     #fun5
#     Z = -x[0]*np.sin(np.sqrt(np.abs(x[0])))-x[1]*np.sin(np.sqrt(np.abs(x[1])))
#     return Z
# 开始随机游走
while (step > epsilon):
    k = 1  # 初始化计数器
    while (k < N):
        # 产生n个向量u
        x1_list = []  # 存放x1的列表
        for i in range(n):
            u = [random.uniform(-1, 1) for i1 in range(variables)]  # 随机向量
            # u1 为标准化之后的随机向量
            u1 = [u[i3] / math.sqrt(sum([u[i2] ** 2 for i2 in range(variables)])) for i3 in range(variables)]
            x1 = [x[i4] + step * u1[i4] for i4 in range(variables)]
            x1_list.append(x1)
        f1_list = [function(x1) for x1 in x1_list]
        f1_min = min(f1_list)
        f1_index = f1_list.index(f1_min)
        x11 = x1_list[f1_index]  # 最小f1对应的x1
        if (f1_min < function(x)):  # 如果找到了更优点
            k = 1
            x = x11
        else:
            k += 1
    step = step * 0.95
    print("第%d次随机游走完成。" % walk_num)
    walk_num += 1
print("随机游走次数:", walk_num - 1)
print("最终最优点:", x)
print("最终最优值:", function(x))
