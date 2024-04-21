#Autor: Illia Azler 239537

x = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

true_val = -1.00657107000000e-11

function forward(x, y, T)
    sum = T(0.0)
    for i in 1:length(x)
        sum += x[i] * y[i]
    end
    return sum
end

function backward(x, y, T)
    sum = T(0.0)
    for i in length(x):-1:1
        sum += x[i] * y[i]
    end
    return sum
end

function descending(x, y)
    p = x .* y
    sum_pos = sum(sort(filter(arr -> arr > 0, p), rev=true))
    sum_neg = sum(sort(filter(arr -> arr < 0, p)))
    return sum_pos + sum_neg
end

function ascending(x, y)
    p = x .* y
    sum_pos = sum(sort(filter(arr -> arr > 0, p)))
    sum_neg = sum(sort(filter(arr -> arr < 0, p), rev=true))
    return sum_pos + sum_neg
end


for T in [Float32, Float64]
    arr1 = Array{T,1}(x)
    arr2 = Array{T,1}(y)
    println(T)
    println("Forward: ", forward(arr1, arr2, T))
    println("Backward:", backward(arr1, arr2, T))
    println("Descending: ", descending(arr1, arr2))
    println("Ascending: ", ascending(arr1, arr2), '\n')
end

#println(true_val)