import numpy as np
from scipy import spatial
import matplotlib.pyplot as plt
from matplotlib.ticker import FormatStrFormatter
from sko.SA import SA_TSP


def read_city_location(file_name):
    """
    读取TXT文件,文件中的数据组织形式为：
    1、每一行 城市序号 X轴位置 Y轴位置
    2、每一行 X轴位置 Y轴位置 城市序号
    返回一个含有文件中所有位置信息的numpy数组
    """
    fo = open(file_name, "r")
    location_ls = fo.readlines()  # 存储有每个城市位置的列表
    num_points = len(location_ls)  # 该变量用来标识进行TSP的城市的数量
    location_array = np.zeros(shape=(num_points, 2))  # 用来进行返回的数组
    for i in range(num_points):
        # location_array[i] = list(map(float, location_ls[i].rstrip().split()[1:]))  # 处理读入的每一行 去结尾，分割，转化
        location_array[i] = list(map(float, location_ls[i].rstrip().split()[:2]))  # 当读入文件为China34时更改
    fo.close()
    return location_array


"""通过文件读入的三个例子"""
# points_coordinate = read_city_location('City70.txt')
# points_coordinate = read_city_location('City100.txt')
points_coordinate = read_city_location('China34.txt')
num_points = len(points_coordinate)

"""随机生成50个城市位置的例子"""
# num_points = 50
# points_coordinate = np.random.rand(num_points, 2)  # 生成指定个代表城市的数据点

"""测算各个点间距离"""
distance_matrix = spatial.distance.cdist(points_coordinate, points_coordinate, metric='euclidean')


def cal_total_distance(routine):
    """
    The objective function. input routine, return total distance.
    cal_total_distance(np.arange(num_points))
    """
    num_points, = routine.shape
    return sum([distance_matrix[routine[i % num_points], routine[(i + 1) % num_points]] for i in range(num_points)])


sa_tsp = SA_TSP(func=cal_total_distance, x0=range(num_points), T_max=1000, T_min=1, L=10 * num_points)
best_points, best_distance = sa_tsp.run()
print("规划路径:\n", best_points)
print("规划路径长度:", best_distance)

fig, ax = plt.subplots(1, 2)
best_points_ = np.concatenate([best_points, [best_points[0]]])
best_points_coordinate = points_coordinate[best_points_, :]
ax[0].plot(sa_tsp.best_y_history)
ax[0].set_xlabel("Iteration")
ax[0].set_ylabel("Distance")
ax[1].plot(best_points_coordinate[:, 0], best_points_coordinate[:, 1],
           marker='o', markerfacecolor='b', color='c', linestyle='-')
ax[1].xaxis.set_major_formatter(FormatStrFormatter('%.3f'))
ax[1].yaxis.set_major_formatter(FormatStrFormatter('%.3f'))
ax[1].set_xlabel("Longitude")
ax[1].set_ylabel("Latitude")
plt.show()
