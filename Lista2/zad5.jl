#Autor: Illia Azler 239537

function logistic_growth_Float32_64(type, p0, r, iterations)
    p = type(p0)
    pn = p
    for i in 1:iterations
        pn = pn + r * pn * (1 - pn)
        #println("p0:", pn)
    end
    return pn
end

function logistic_growth_Float32_cut(p0, r, iterations)
    p = Float32(p0)
    pn = p
    for i in 1:iterations
        pn = pn + r * pn * (1 - pn)
        if i == 10
            pn = floor(pn * 10^3) / 10^3
            #println("p0(obciete): ", string(round(pn, digits=3)))
        end
    end
    return pn
end


# Eksperyment 1 Float32 
experiment1 = logistic_growth_Float32_64(Float32, 0.01, 3.0, 40)
println("Float32 (p_0 = 0.01, r = 3): ", experiment1)

# Eksperyment 1.1 Float32 obciety na 10 iteracji
experiment1_1 = logistic_growth_Float32_cut(0.01, 3.0, 40)
println("Float32 cut (p_0 = 0.01, r = 3): ", experiment1_1)

# Eksperyment 2 Float64
experiment2 = logistic_growth_Float32_64(Float64, 0.01, 3.0, 40)
println("Float64 (p_0 = 0.01, r = 3): ", experiment2)