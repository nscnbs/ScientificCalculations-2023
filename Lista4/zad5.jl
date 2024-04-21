#Autor: Illia Azler 239537

include("zad1_4.jl")

using .Metody
using Plots

fa(x) = exp(x)
fb(x) = x^2 * sin(x)

for n in [5, 10, 15]
    plot_a = rysujNnfx(fa, 0.0, 1.0, n)
    plot_b = rysujNnfx(fb, -1.0, 1.0, n)
    savefig(plot_a, "zad5a_n_$n.png")
    savefig(plot_b, "zad5b_n_$n.png")
end