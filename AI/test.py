import numpy as np
import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.metrics.pairwise import euclidean_distances

data_frame = pd.read_csv("./AI/houses.csv")

print(data_frame.info)

features = ["flarea", "bdrms", "bthrms"]

houses = data_frame[features].values

data_frame.insert(1,"flbd", data_frame["flarea"]*data_frame["bdrms"])

def euc(x, xp):
    return np.sqrt(np.sum((x-xp)**2))

your_house = np.array([124, 3, 1])
my_house = np.array([130, 2, 1])

print(euc(your_house, my_house))

distances = [euc(houses[4], x) for x in houses]
print(distances)

scaler = StandardScaler()

scaler.fit(houses)
houses_scaled = scaler.transform(houses)
print(houses_scaled)
