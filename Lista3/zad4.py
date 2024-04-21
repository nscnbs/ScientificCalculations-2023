import numpy as np
import matplotlib.pyplot as plt

def mbisekcji(f, a, b, delta, epsilon):
    u = f(a)
    v = f(b)
    e = b - a
    it = 0

    if np.sign(u) == np.sign(v):
        return "err", "err", "err", 1

    while e > epsilon:
        it += 1
        e = e / 2
        c = a + e
        w = f(c)

        if abs(e) < delta or abs(w) < epsilon:
            return c, w, it, 0

        if np.sign(w) != np.sign(u):
            b = c
            v = w
        else:
            a = c
            u = w

    return "err", "err", "err", 2


def mstycznych(f, pf, x0, delta, epsilon, maxit):
    v = f(x0)

    if abs(v) < epsilon:
        return x0, v, 0, 0

    for it in range(maxit):
        if abs(pf(x0)) < epsilon:
            return x0, v, it, 2

        x1 = x0 - v / pf(x0)
        v = f(x1)

        if abs(x1 - x0) < delta or abs(v) < epsilon:
            return x1, v, it, 0

        x0 = x1

    return x0, v, maxit, 1


def msiecznych(f, x0, x1, delta, epsilon, maxit):
    fa = f(x0)
    fb = f(x1)

    for it in range(maxit):
        if abs(fa) < abs(fb):
            x0, x1 = x1, x0
            fa, fb = fb, fa

        s = (x1 - x0) / (fb - fa)
        x0 = x1
        fa = fb
        x1 = x1 - fa * s
        fb = f(x1)

        if abs(x1 - x0) < delta or abs(fb) < epsilon:
            return x1, fb, it, 0

    return x1, fb, maxit, 1


# Funkcja reprezentująca równanie sin(x) - (1/2 * x)^2
def equation(x):
    return np.sin(x) - (1/2 * x)**2

# Pochodna funkcji
def derivative_equation(x):
    return np.cos(x) - x/2

# Przybliżony pierwiastek
x0 = 1.5

# Przedział dla bisekcji
a_bisekcji = 1.5
b_bisekcji = 2

# Przybliżone punkty dla siecznych
x0_sieczne = 1
x1_sieczne = 2

# Parametry
delta = 1/2 * 10**-5
epsilon = 1/2 * 10**-5
maxit = 1000

# Wywołanie funkcji
result_bisekcji = mbisekcji(equation, a_bisekcji, b_bisekcji, delta, epsilon)
result_newton = mstycznych(equation, derivative_equation, x0, delta, epsilon, maxit)
result_sieczne = msiecznych(equation, x0_sieczne, x1_sieczne, delta, epsilon, maxit)

# Wyświetlenie wyników
print("Bisekcja:", result_bisekcji)
print("Newton:", result_newton)
print("Sieczne:", result_sieczne)

# Wygenerowanie wykresu
x_values = np.linspace(1, 2, 1000)
y_values = equation(x_values)

plt.plot(x_values, y_values, label="sin(x) - (1/2 * x)^2")
plt.axhline(0, color="black", linestyle="--", linewidth=0.8)
plt.scatter(result_bisekcji[0], result_bisekcji[1], color="red", label="Bisekcja")
plt.scatter(result_newton[0], result_newton[1], color="blue", label="Newton")
plt.scatter(result_sieczne[0], result_sieczne[1], color="green", label="Sieczne")
plt.legend()
plt.title("Wykres funkcji i pierwiastków")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
