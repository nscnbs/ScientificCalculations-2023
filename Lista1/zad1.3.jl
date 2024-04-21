#Autor: Illia Azler 239537

function find_max(T)
    max_value = prevfloat(T(1.0))
    while !isinf(2 * max_value)
        max_value *= 2
    end
    return max_value
end


for i in [Float16, Float32, Float64]
    println(i, '\n', "Max (Calculated): ", find_max(i), '\n', "Max (Julia): ", floatmax(i), '\n')
end
