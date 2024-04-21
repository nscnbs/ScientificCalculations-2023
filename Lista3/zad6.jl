#Autor: Illia Azler 239537


include("zad1_3.jl")  # Import modułu Metody
using .Metody

# Funkcja dla równania f1(x) = e^(1−x) − 1
f1(x) = exp(1 - x) - 1

# Funkcja dla równania f2(x) = xe^(-x)
f2(x) = x * exp(-x)

# Pochodna dla metody Newtona
f_prime_eq(x) = -exp(1 - x)

# Parametry wspólne dla obu funkcji
delta, epsilon = 1e-5, 1e-5
maxit = 100

# Funkcja pomocnicza do wyświetlania wyników
function print_results(result, method_name, info)
    if result[4] == 1 && (method_name == "Metoda bisekcji dla f1" || method_name == "Metoda bisekcji dla f2")
        println("$method_name - Błąd: Funkcja nie zmienia znaku w przedziale [a, b]")
        println("Kod błędu: ", result[4])
        println("")
    elseif result[4] == 1
        println("$method_name - Błąd: Funkcja nie osiągnęła wymaganej dokładności w maxit iteracji")
        println("Kod błędu: ", result[4])
        println("")
    elseif result[4] == 2
        println("$method_name - Błąd: Pochodna bliska zeru")
        println("Kod błędu: ", result[4])
        println("")
    else
        println("$method_name - $info - Pierwiastek: ", result[1])
        println("$method_name - $info - Wartość funkcji w pierwiastku: ", result[2])
        println("$method_name - $info - Liczba iteracji: ", result[3])
        println("$method_name - $info - Kod błędu: ", result[4])
        println("")
    end
end

# Test dla funkcji f1
println("-----------TEST METOD DLA f1-----------")

# Przedziały dla metody bisekcji dla f1
intervals_bisect_f1 = [(0.5, 2.0), (0.1, 2.0), (0.5, 1.5), (2.0, 10.0), (-100.0, 100.0)]

# Przybliżenia początkowe dla metody Newtona dla f1
initial_guesses_newton_f1 = [-10.0, 1.0, 10.0, 50.0, 100.0]

# Przybliżenia początkowe dla metody siecznych dla f1
initial_guesses_secant_f1 = [(-0.5, 1.0), (0.5, 2.0), (5.0, 10.0), (10.0, 100.0), (-100.0, 100.0)]

for i in 1:5
    println("\nPrzykład $i:")

    # Test dla metody bisekcji dla f1
    result_bisect_f1 = mbisekcji(f1, intervals_bisect_f1[i][1], intervals_bisect_f1[i][2], delta, epsilon)
    print_results(result_bisect_f1, "Metoda bisekcji dla f1", "Przedział: $(intervals_bisect_f1[i])")

    # Test dla metody Newtona dla f1
    result_newton_f1 = mstycznych(f1, f_prime_eq, initial_guesses_newton_f1[i], delta, epsilon, maxit)
    print_results(result_newton_f1, "Metoda Newtona dla f1", "Przybliżenie początkowe: $(initial_guesses_newton_f1[i])")

    # Test dla metody siecznych dla f1
    result_secant_f1 = msiecznych(f1, initial_guesses_secant_f1[i][1], initial_guesses_secant_f1[i][2], delta, epsilon, maxit)
    print_results(result_secant_f1, "Metoda siecznych dla f1", "Przybliżenia początkowe: $(initial_guesses_secant_f1[i])")
end

# Test dla funkcji f2
println("\n-----------TEST METOD DLA f2-----------")

# Przedziały dla metody bisekcji dla f2
intervals_bisect_f2 = [(0.0, 20.0), (-0.5, 2.0), (-1.0, 10.0), (-10.0, 10.0), (-100.0, 100.0)]

# Przybliżenia początkowe dla metody Newtona dla f2
initial_guesses_newton_f2 = [-10.0, 1.0, 10.0, 50.0, 100.0]

# Przybliżenia początkowe dla metody siecznych dla f2
initial_guesses_secant_f2 = [(-0.5, 1.0), (0.5, 2.0), (5.0, 10.0), (10.0, 100.0), (-100.0, 100.0)]

for i in 1:5
    println("\nPrzykład $i:")

    # Test dla metody bisekcji dla f2
    result_bisect_f2 = mbisekcji(f2, intervals_bisect_f2[i][1], intervals_bisect_f2[i][2], delta, epsilon)
    print_results(result_bisect_f2, "Metoda bisekcji dla f2", "Przedział: $(intervals_bisect_f2[i])")

    # Test dla metody Newtona dla f2
    result_newton_f2 = mstycznych(f2, f_prime_eq, initial_guesses_newton_f2[i], delta, epsilon, maxit)
    print_results(result_newton_f2, "Metoda Newtona dla f2", "Przybliżenie początkowe: $(initial_guesses_newton_f2[i])")

    # Test dla metody siecznych dla f2
    result_secant_f2 = msiecznych(f2, initial_guesses_secant_f2[i][1], initial_guesses_secant_f2[i][2], delta, epsilon, maxit)
    print_results(result_secant_f2, "Metoda siecznych dla f2", "Przybliżenia początkowe: $(initial_guesses_secant_f2[i])")
end
