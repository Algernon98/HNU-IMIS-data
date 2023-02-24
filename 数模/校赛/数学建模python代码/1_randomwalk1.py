# -*- coding: utf-8 -*-
'''
@Description:使用随机游走算法求解函数极值
这里求解:f = sin(r)/r + 1,r = sqrt((x-50)^2+(y-50)^2)+e,0<=x,y<=100 的最大值
求解f的最大值1.1512，可以转化为求-f的最小值问题

如果将初始点设置得离最优点较远，
如初始点为(10,10)时，随机游走陷入了局部最优点。

如果增大迭代次数N以及初始步长λ，可以增强寻优能力，
如N=3000,λ=10.0，最终达到了全局最优点。

'''
from __future__ import print_function
import math
import random
# import numpy as np

N = 3000  # 迭代次数100
step = 10  # 初始步长λ0.5
epsilon = 0.00001
variables = 2  # 变量数目

# 初始点坐标
x = [40, 40]  # 适用于fun1的起始点 成功
# x = [10, 10]  # 适用于fun2的起始点 成功
# x = [10, 10]  # 适用于fun3的起始点 失败
# x = [10, 10]  # 适用于fun4的起始点 成功
# x = [350,350]  # 适用于fun5的起始点 成功

walk_num = 1  # 初始化随机游走次数
print("迭代次数:", N)
print("初始步长:", step)
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
        u = [random.uniform(-1, 1) for i in range(variables)]  # 随机向量
        # u1 为标准化之后的随机向量
        u1 = [u[i] / math.sqrt(sum([u[i] ** 2 for i in range(variables)])) for i in range(variables)]
        x1 = [x[i] + step * u1[i] for i in range(variables)]
        if (function(x1) < function(x)):  # 如果找到了更优点
            k = 1
            x = x1
        else:
            k += 1
    step = step * 0.5
    print("第%d次随机游走完成。" % walk_num)
    walk_num += 1
print("随机游走次数:", walk_num - 1)
print("最终最优点:", x)
print("最终最优值:", function(x))
