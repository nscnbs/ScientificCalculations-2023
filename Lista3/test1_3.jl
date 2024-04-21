#Autor: Illia Azler 239537


include("zad1_3.jl")
using .Metody

println("-----------TESTS-----------")
println("------Metoda bisekcji------")
# Przykładowa funkcja kwadratowa metody bisekcji
f(x) = x^2 - 4

# Parametry dla metody bisekcji
a = 0.0
b = 2.0
delta = 0.01
epsilon = 0.001

# Wywołanie funkcji mbisekcji
result = mbisekcji(f, a, b, delta, epsilon)

# Wyświetlenie wyników
if result[1] == "err"
    println("Błąd: Funkcja nie zmienia znaku w przedziale [a, b]")
    println("Kod błędu: ", result[4])
else
    println("Pierwiastek: ", result[1])
    println("Wartość funkcji w pierwiastku: ", result[2])
    println("Liczba iteracji: ", result[3])
    println("Kod błędu: ", result[4])
end

println("------Metoda Newtona------")
# Przykładowa funkcja kwadratowa metody Newtona
f_newton(x) = x^2 - 2
f_prime_newton(x) = 2x

# Parametry dla metody Newtona
x0_newton = 1.0
delta_newton = 0.01
epsilon_newton = 0.001
maxit_newton = 20

# Wywołanie funkcji mstycznych
result_newton = mstycznych(f_newton, f_prime_newton, x0_newton, delta_newton, epsilon_newton, maxit_newton)

# Wyświetlenie wyników
if result_newton[4] == 1
    println("Błąd: Funkcja nie osiągnęła wymaganej dokładności w maxit iteracji")
elseif result_newton[4] == 2
    println("Błąd: Pochodna bliska zeru")
else
    println("Pierwiastek: ", result_newton[1])
    println("Wartość funkcji w pierwiastku: ", result_newton[2])
    println("Liczba iteracji: ", result_newton[3])
    println("Kod błędu: ", result_newton[4])
end

println("------Metoda siecznych------")
# Przykładowa funkcja kwadratowa metody siecznych
f_secant(x) = x^2 - 2

# Parametry dla metody siecznych
x0_secant = 0.0
x1_secant = 2.0
delta_secant = 0.01
epsilon_secant = 0.001
maxit_secant = 20

# Wywołanie funkcji msiecznych
result_secant = msiecznych(f_secant, x0_secant, x1_secant, delta_secant, epsilon_secant, maxit_secant)

# Wyświetlenie wyników
if result_secant[4] == 1
    println("Błąd: Funkcja nie osiągnęła wymaganej dokładności w maxit iteracji")
else
    println("Pierwiastek: ", result_secant[1])
    println("Wartość funkcji w pierwiastku: ", result_secant[2])
    println("Liczba iteracji: ", result_secant[3])
    println("Kod błędu: ", result_secant[4])
end
