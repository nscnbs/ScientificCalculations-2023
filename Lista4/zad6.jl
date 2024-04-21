#Autor: Illia Azler 239537

include("zad1_4.jl")

using .Metody
using Plots

fa(x) = abs(x)
fb(x) = 1 / (1 + x^2)

for n in [5, 10, 15]
    plot_a = rysujNnfx(fa, -1.0, 1.0, n)
    plot_b = rysujNnfx(fb, -5.0, 5.0, n)
    savefig(plot_a, "zad6a_n_$n.png")
    savefig(plot_b, "zad6b_n_$n.png")
end