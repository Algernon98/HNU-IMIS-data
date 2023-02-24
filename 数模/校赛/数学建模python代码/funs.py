# -*- coding: utf-8 -*-
"""
Created on Fri Jul 10 16:13:12 2020

@author: Administrator
"""

import numpy as np
pi=np.pi
fit1_lb=[0, 0]
fit1_ub=[100, 100]

fit2_lb=[0, 0]
fit2_ub=[5, 15]

fit3_lb=[-600, -600]
fit3_ub=[600, 600]

# 添加
fit4_lb=[-100,-100]
fit4_ub=[100,100]


# 添加
fit5_lb=[-500,-500]
fit5_ub=[500,500]

# 添加
def fitness5(x):
    '''
    Schwefel's 函数，自变量为一个n维向量
    该向量的每一个分量 -500=<x(i)<=500
    当自变量的每一个分量的值为420.9687
    有一个全局最小值为 -n*428.9839
    '''
    z = 0
    for i in range(1, x.size+1):
        z = z-x[i-1]*np.sin(np.sqrt(np.abs(x[i-1])))
    return z


# 添加
def fitness4(p):
    '''
    Easom's函数,-100<=x<=100, -100<=y<=100
    有一个全局最小值-1在坐标(pi,pi)
    '''
    x,y = p
    z = -np.cos(x) * np.cos(y) * np.exp(-((x-np.pi)**2 + (y-np.pi)**2))
    return z


def fitness3(x):
    '''
    Griewank函数, 在x=(0, 0, ..., 0)处有全局极小值0, 
     -600<=x<=600, x为向量，维数可任意大小
    '''
    y1 = np.sum(x**2 / 4000)
    y2 = 1
    for i in range(1, x.size+1):
        y2=y2 * np.cos(x[i-1] / np.sqrt(i))
    return y1-y2+1 


def fitness2(p):
    '''
    Branins's rcos函数，-5<=x<=10, 0<=y<=15
    3个最小值0.397887: 
    (-pi,12.275), (pi, 2.275), (9.42478, 2.475)
    局部最优值0.8447
    '''    
    x, y = p
    z=(y-51*(x**2)/(40*pi**2)+5*x/pi-6)**2 + 10*(1-1/(8*pi))*np.cos(x)+10
    return z


def fitness1(p):
    '''
    一个针状函数，取值范围为 0 <= x, y <= 100
    有一个最大值为1.1512在坐标(50,50)
    '''
    x, y = p
    r = np.square( (x-50)** 2 + (y-50)** 2 )+np.exp(1)
    t = np.sin(r) / r + 1
    return -1 * t        # 转化为求最小值
