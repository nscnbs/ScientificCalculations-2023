#Autor: Illia Azler 239537

function find_kahan(T)
    T(3.0) * (T(4.0 / 3.0) - T(1.0)) - T(1.0)
end

for i in [Float16, Float32, Float64]
    println(i, '\n', "Kahan Epsilon: ", find_kahan(i), '\n', "eps (Julia): ", eps(i), '\n')
end