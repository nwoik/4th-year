import random
from time import sleep
import numpy as np

import numpy.linalg as npla

from math import sqrt


def make_matrix(n, m):
    return np.array([[random.randint(0, 15) for i in range(n)], [random.randint(0,15) for j in range(m)]], object)

def hadamard():
    m = random.randint(2,4)
    n = random.randint(2,4)
    p = random.randint(2,4)

    A = np.arange()
    B = make_matrix(p, n)

    print("A")
    print(A)
    print("B")
    print(B)
    print()
    return

def matrix_multiplication():
    return

def main():
    user_prompt = input("What would you like to practice [1] Hadamard Product [2] Matrix multiplication: ")
    print()
    print()

    if user_prompt == "1":
        hadamard()
    elif user_prompt == "2":
        matrix_multiplication()
    elif user_prompt == ("" or "q"):
        print("Closing...")
        sleep(2)
        return
    else:
        return main()

    return 




if __name__ == "__main__":
    main()