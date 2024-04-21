import matplotlib.pyplot as plt
import numpy as np

# Funkcja kwadratowa
def f(x):
    return x**2 - 2

# Przybliżenia początkowe dla metody siecznych
x0, x1 = 0.0, 2.0

# Zerowe funkcji
zero = np.sqrt(2)

# Wygenerowanie danych do wykresu
x = np.linspace(0, 2, 100)
y = f(x)

# Wykres funkcji
plt.plot(x, y, label='f(x)')

# Oznaczenie osi x
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)

# Oznaczenie przybliżeń początkowych dla metody siecznych
plt.scatter(x0, f(x0), color='red', marker='o', label='x0')
plt.scatter(x1, f(x1), color='green', marker='o', label='x1')

# Oznaczenie miejsca zerowego
plt.axvline(zero, color='orange', linestyle='--', label='Zero funkcji')

plt.title('Metoda Siecznych')
plt.legend()
plt.show()
