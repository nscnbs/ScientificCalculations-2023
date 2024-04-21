#Autor: Illia Azler 239537


include("zad1_3.jl")
using .Metody

f_eq(x) = sin(x) - (1 / 2 * x)^2

f_prime_eq(x) = cos(x) - x / 2

delta = 1 / 2 * 1e-5
epsilon = 1 / 2 * 1e-5
maxit = 100

# Test dla metody bisekcji
println("-----------TEST METODY BISEKCJI-----------")
a_bisect, b_bisect = 1.5, 2.0
result_bisect = mbisekcji(f_eq, a_bisect, b_bisect, delta, epsilon)

if result_bisect[4] == 1
    println("Błąd: Funkcja nie zmienia znaku w przedziale [a, b]")
    println("Kod błędu: ", result_bisect[4])
else
    println("Pierwiastek: ", result_bisect[1])
    println("Wartość funkcji w pierwiastku: ", result_bisect[2])
    println("Liczba iteracji: ", result_bisect[3])
    println("Kod błędu: ", result_bisect[4])
end

# Test dla metody Newtona
println("\n-----------TEST METODY NEWTONA-----------")
x0_newton = 1.5
result_newton = mstycznych(f_eq, f_prime_eq, x0_newton, delta, epsilon, maxit)

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

# Test dla metody siecznych
println("\n-----------TEST METODY SIECZNYCH-----------")
x0_secant, x1_secant = 1.0, 2.0
result_secant = msiecznych(f_eq, x0_secant, x1_secant, delta, epsilon, maxit)

if result_secant[4] == 1
    println("Błąd: Funkcja nie osiągnęła wymaganej dokładności w maxit iteracji")
else
    println("Pierwiastek: ", result_secant[1])
    println("Wartość funkcji w pierwiastku: ", result_secant[2])
    println("Liczba iteracji: ", result_secant[3])
    println("Kod błędu: ", result_secant[4])
end
