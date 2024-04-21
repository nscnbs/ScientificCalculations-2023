import matplotlib.pyplot as plt
import numpy as np

# Funkcja kwadratowa
def f(x):
    return x**2 - 2

# Pochodna funkcji kwadratowej
def f_prime(x):
    return 2 * x

# Przybliżenie początkowe dla metody Newtona
x0 = 1.0

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

# Oznaczenie przybliżenia początkowego dla metody Newtona
plt.scatter(x0, f(x0), color='red', marker='o', label='Przybliżenie początkowe')

# Oznaczenie miejsca zerowego
plt.axvline(zero, color='orange', linestyle='--', label='Zero funkcji')

plt.title('Metoda Newtona')
plt.legend()
plt.show()
