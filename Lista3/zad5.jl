#Autor: Illia Azler 239537


include("zad1_3.jl")
using .Metody

f(x) = 3x - exp(x)

delta = 1e-4
epsilon = 1e-4

println("-----------TEST METODY BISEKCJI-----------")

# Przedział [-1.0, 0.0]
a_bisect, b_bisect = -1.0, 0.0
result_bisect = mbisekcji(f, a_bisect, b_bisect, delta, epsilon)

if result_bisect[4] == 1
    println("Błąd: Funkcja nie zmienia znaku w przedziale [-1.0, 0.0]")
    println("Kod błędu: ", result_bisect[4])
else
    println("Pierwiastek (przedział [-1, 0]): ", result_bisect[1])
    println("Wartość funkcji w pierwiastku: ", result_bisect[2])
    println("Liczba iteracji: ", result_bisect[3])
    println("Kod błędu: ", result_bisect[4])
end


# Przedział [0.0, 0.61]
a_bisect, b_bisect = 0.0, 0.61
result_bisect = mbisekcji(f, a_bisect, b_bisect, delta, epsilon)

if result_bisect[4] == 1
    println("Błąd: Funkcja nie zmienia znaku w przedziale [0.0, 0.61]")
    println("Kod błędu: ", result_bisect[4])
else
    println("Pierwiastek (przedział [-1, 0]): ", result_bisect[1])
    println("Wartość funkcji w pierwiastku: ", result_bisect[2])
    println("Liczba iteracji: ", result_bisect[3])
    println("Kod błędu: ", result_bisect[4])
end


# Przedział [0.0, 0.62]
a_bisect, b_bisect = 0.0, 0.62
result_bisect = mbisekcji(f, a_bisect, b_bisect, delta, epsilon)

if result_bisect[4] == 1
    println("Błąd: Funkcja nie zmienia znaku w przedziale [0.0, 0.62]")
    println("Kod błędu: ", result_bisect[4])
else
    println("Pierwiastek (przedział [0.0, 0.62]): ", result_bisect[1])
    println("Wartość funkcji w pierwiastku: ", result_bisect[2])
    println("Liczba iteracji: ", result_bisect[3])
    println("Kod błędu: ", result_bisect[4])
end

# Przedział [0.0, 1.0]
a_bisect, b_bisect = 0.0, 1.0
result_bisect = mbisekcji(f, a_bisect, b_bisect, delta, epsilon)

if result_bisect[4] == 1
    println("Błąd: Funkcja nie zmienia znaku w przedziale [a, b]")
    println("Kod błędu: ", result_bisect[4])
else
    println("Pierwiastek (przedział [0.0, 1.0]): ", result_bisect[1])
    println("Wartość funkcji w pierwiastku: ", result_bisect[2])
    println("Liczba iteracji: ", result_bisect[3])
    println("Kod błędu: ", result_bisect[4])
end

# Przedział [1.0, 2.0]
a_bisect, b_bisect = 1.0, 2.0
result_bisect = mbisekcji(f, a_bisect, b_bisect, delta, epsilon)

if result_bisect[4] == 1
    println("Błąd: Funkcja nie zmienia znaku w przedziale [a, b]")
    println("Kod błędu: ", result_bisect[4])
else
    println("Pierwiastek (przedział [1.0, 2.0]): ", result_bisect[1])
    println("Wartość funkcji w pierwiastku: ", result_bisect[2])
    println("Liczba iteracji: ", result_bisect[3])
    println("Kod błędu: ", result_bisect[4])
end

# Przedział [2.0, 3.0]
a_bisect, b_bisect = 9.0, 10.0
result_bisect = mbisekcji(f, a_bisect, b_bisect, delta, epsilon)

if result_bisect[4] == 1
    println("Błąd: Funkcja nie zmienia znaku w przedziale [2.0, 3.0]]")
    println("Kod błędu: ", result_bisect[4])
else
    println("Pierwiastek (przedział [1.0, 2.0]): ", result_bisect[1])
    println("Wartość funkcji w pierwiastku: ", result_bisect[2])
    println("Liczba iteracji: ", result_bisect[3])
    println("Kod błędu: ", result_bisect[4])
end
