import pandas as pd
import matplotlib.pyplot as plt
import funs
from sko.SA import SA

"""示例函数"""
demo_func = lambda x: x[0] ** 2 + (x[1] - 0.05) ** 2 + x[2] ** 2
"""对funs文件中的5个函数求最值"""
# sa = SA(func=demo_func, x0=[1, 1, 1], T_max=1, T_min=1e-9, L=300, max_stay_counter=150)
# sa = SA(func=funs.fitness1, x0=[10, 10], T_max=1, T_min=1e-9, L=300, max_stay_counter=150)
# sa = SA(func=funs.fitness2, x0=[10, 10], T_max=1, T_min=1e-9, L=300, max_stay_counter=150)
# sa = SA(func=funs.fitness3, x0=[10, 10], T_max=1, T_min=1e-9, L=300, max_stay_counter=150)
# sa = SA(func=funs.fitness4, x0=[10, 10], T_max=1, T_min=1e-9, L=300, max_stay_counter=150)
sa = SA(func=funs.fitness5, x0=[350, 350], T_max=1, T_min=1e-9, L=300, max_stay_counter=150)

best_x, best_y = sa.run()
print('best_x:', best_x, 'best_y', best_y)

plt.plot(pd.DataFrame(sa.best_y_history).cummin(axis=0))
plt.show()




