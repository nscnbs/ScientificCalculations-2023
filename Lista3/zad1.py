import matplotlib.pyplot as plt
import numpy as np

# Funkcja kwadratowa
def f(x):
    return x**2 - 2

# Przedział dla metody bisekcji
a, b = 0.0, 2.0

# Wartości funkcji na krańcach przedziału
fa, fb = f(a), f(b)

# Zerowe funkcji
zero = np.sqrt(2)

# Wygenerowanie danych do wykresu
x = np.linspace(a, b, 100)
y = f(x)

# Wykres funkcji
plt.plot(x, y, label='f(x)')

# Oznaczenie osi x
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)

# Oznaczenie przedziału dla metody bisekcji
plt.axvline(a, color='r', linestyle='--', label='a')
plt.axvline(b, color='g', linestyle='--', label='b')

# Oznaczenie punktów charakterystycznych
plt.scatter([a, b], [fa, fb], color='blue', marker='o', label='Krańce przedziału')

# Oznaczenie miejsca zerowego
plt.axvline(zero, color='orange', linestyle='--', label='Zero funkcji')

plt.title('Metoda Bisekcji')
plt.legend()
plt.show()
