import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-40, 40, 400)

y = np.exp(x) * np.log(1 + np.exp(-x))

print(x)
#print("f(x): ", y)

plt.plot(x, y)
plt.xlabel('x')
plt.ylabel('f(x)')
plt.title('f(x) = e^x * ln(1+e^(-x))')
plt.grid(True)

plt.show()
