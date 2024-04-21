#Autor: Illia Azler 239537

delta = 2.0^(-52)  # wartość kroku
lower_bound = 1.0  # dolna granica przedziału
upper_bound = 2.0  # górna granica przedziału

# Sprawdzenie równomierności rozmieszczenia [1,2]
for k in 1:10 #((2^52)-1)
    x = lower_bound + k * delta
    println("Przedzial [1;2] | Liczba $x: ", bitstring(x))
end

for k in 1:10 #((2^52)-1)
    x = 0.5 + k * (2^-53)
    println("Przedzial [0.5;1] | Liczba $x: ", bitstring(x))
end

for k in 1:10 #((2^52)-1)
    x = 2 + k * (2^-51)
    println("Przedzial [2;4] | Liczba $x: ", bitstring(x))
end
