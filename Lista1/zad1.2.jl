#Autor: Illia Azler 239537

function find_eta(T)
    eta = T(1.0)
    while T(eta / 2) > T(0.0)
        eta /= 2
    end
    return eta
end

for i in [Float16, Float32, Float64]
    println(i, '\n', "Eta (Calculated): ", find_eta(i), '\n', "Eta (Julia): ", nextfloat(i(0.0)), '\n')
end
