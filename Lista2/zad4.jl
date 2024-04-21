#Autor: Illia Azler 239537

using Polynomials
using LinearAlgebra

coef = [1, -210.0, 20615.0, -1256850.0,
    53327946.0, -1672280820.0, 40171771630.0, -756111184500.0,
    11310276995381.0, -135585182899530.0,
    1307535010540395.0, -10142299865511450.0,
    63030812099294896.0, -311333643161390640.0,
    1206647803780373360.0, -3599979517947607200.0,
    8037811822645051776.0, -12870931245150988800.0,
    13803759753640704000.0, -8752948036761600000.0,
    2432902008176640000.0]

P = Polynomial(reverse(coef))
roots_P = roots(P)

function p(x)
    return (x - 20) * (x - 19) * (x - 18) * (x - 17) * (x - 16) * (x - 15) * (x - 14) * (x - 13) * (x - 12) * (x - 11) * (x - 10) * (x - 9) * (x - 8) * (x - 7) * (x - 6) * (x - 5) * (x - 4) * (x - 3) * (x - 2) * (x - 1)
end

println("Pierwiastki z_k:")
for z_k in roots_P
    println(z_k)
end

println("\nPostac normalna[|P(x)|]:")
for k in 1:20
    println(norm(P(roots_P[k])))
end

println("\nPostac iloczynowa[|p(x)|]:")
for k in 1:20
    println(norm(p(roots_P[k])))
end

println("\n|zk-k|")
for k in 1:20
    println(norm(roots_P[k] - k))
end

println("\nCzęść b\n")
coef[2] = -210.0 - 2.0^(-23)
P = Polynomial(reverse(coef))
roots_P = roots(P)

println("Pierwiastki z_k:")
for r in roots_P
    println(r)
end

println("\nPostac normalna[|P(x)|]:")
for k in 1:20
    println(norm(P(roots_P[k])))
end

println("\nPostac iloczynowa[|p(x)|]:")
for k in 1:20
    println(norm(p(roots_P[k])))
end

println("\n|zk-k|")
for k in 1:20
    println(norm(roots_P[k] - k))
end