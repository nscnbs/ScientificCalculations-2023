#Autor: Illia Azler 239537

include("hilb.jl")
include("matcond.jl")

function H(A)
    M = hilb(A)
    x = ones(A)
    b = M * x

    gauss = M \ b
    inverse = inv(M) * b
    println("$A\t$(cond(M))\t$(rank(M))\t$(norm(inverse - x)/norm(x))\t$(norm(gauss - x)/norm(x))")
end

function randM(n, c)
    M = matcond(n, c)
    x = ones(n)
    b = M * x

    gauss = M \ b
    inverse = inv(M) * b
    println("$n\t$(cond(M))\t$(rank(M))\t$(norm(inverse - x)/norm(x))\t$(norm(gauss - x)/norm(x))")
end

println("Macierz Hilbert'a:")
println("k\tcond(M)\trank(M)\tBłąd inverse\tBłąd Gauss")
for n in 1:2:35
    H(n)
end

println("\nMacierz Losowa:")
println("k\tcond(M)\trank(M)\tBłąd inverse\tBłąd Gauss")
for n in [5, 10, 20]
    for c in [0, 1, 3, 7, 12, 16]
        randM(n, 10.0^c)
    end
end
