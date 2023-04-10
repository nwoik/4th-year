import matplotlib.pyplot as plot

x = []
y = []
bit = 16

# naming the x axis
plot.xlabel('Number of Challeges (k)')
# naming the y axis
plot.ylabel('Probability (p)')

# giving a title to my graph
plot.title('Probability of each challenge being Unique')
prob = 0.0
def get_prob(N, num_k):
    pos = num_k
    act = N - 1.0
    prob = (num_k - act)/num_k
    y.append(prob)

def get_x_coord(num1, num2):
    for i in (range(num1, num2 + 1)):
        x.append(i)
        get_prob(i, num2)

get_x_coord(1,2**bit)

plot.plot(x,y)
plot.show()