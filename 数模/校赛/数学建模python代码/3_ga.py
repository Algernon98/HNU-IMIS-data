# -*- coding: utf-8 -*-
import numpy as np
pi=np.pi
def schaffer(p):
    '''
    global minimum at (0,0) with value 0
    0.5+(sin((x1^2+x2^2)^0.5)^2-0.5)./(1+0.001*(x1^2+x2^2))^2
    '''
    x1, x2 = p
    #x = np.square(x1) + np.square(x2)
    x = x1**2 + x2**2
    return 0.5 + (np.sin(np.square(x))**2 - 0.5) / (1 + 0.001 * x)**2


# %% Do GA遗传算法
from sko.GA import GA
import funs
# ga = GA(func=schaffer, n_dim=2, size_pop=50, max_iter=800, lb=[-1, -1], ub=[1, 1], precision=1e-7)
fun = funs.fitness4
lbs = funs.fit4_lb
ubs = funs.fit4_ub
ga = GA(func=fun, n_dim=2, size_pop=200, max_iter=400, lb=lbs, ub=ubs, precision=1e-7)
# ga = GA(func=fitness2, n_dim=2, size_pop=50, max_iter=150, lb=[5, 0], ub=[10, 15], precision=1e-9)
best_x, best_y = ga.run()
print('best_x:', best_x, '\n', 'best_y:', best_y)

# %% Plot the result
import pandas as pd
import matplotlib.pyplot as plt

Y_history = pd.DataFrame(ga.all_history_Y)
fig, ax = plt.subplots(2, 1)
ax[0].plot(Y_history.index, Y_history.values, '.', color='red')
Y_history.min(axis=1).cummin().plot(kind='line')
plt.show()
