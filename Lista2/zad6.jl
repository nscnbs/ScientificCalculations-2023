#Autor: Illia Azler 239537

function f(c, x)
    for i in range(1, 40)
        x = x^(2.0) + c
        println(x)
    end
end

println("\nc = −2 i x0 = 1\n")
f(-2, 1)
println("\nc = −2 i x0 = 2\n")
f(-2, 2)
println("\nc = −2 i x0 = 1.99999999999\n")
f(-2, 1.99999999999999)
println("\nc = −1 i x0 = 1\n")
f(-1, 1)
println("\nc = −1 i x0 = −1\n")
f(-1, -1)
println("\nc = −1 i x0 = 0.75\n")
f(-1, 0.75)
println("\nc = −1 i x0 = 0.25\n")
f(-1, 0.25)