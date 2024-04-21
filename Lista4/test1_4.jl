#Autor: Illia Azler 239537

using Test
using Plots

include("zad1_4.jl")

using .Metody

function test_ilorazyRoznicowe()
    x = [3.0, 1.0, 5.0, 6.0]
    f = [1.0, -3.0, 2.0, 4.0]

    fx_expected = [1.0, 2.0, -0.375, 0.175]

    fx = ilorazyRoznicowe(x, f)

    @test fx ≈ fx_expected rtol = 1e-10

    println("Test udany, wynik: ", fx)
end


function test_warNewton()
    x = [3.0, 1.0, 5.0, 6.0]
    f = [1.0, -3.0, 2.0, 4.0]

    ft_expected = 2.0

    fx = ilorazyRoznicowe(x, f)

    ft = warNewton(x, fx, 5.0)

    @test ft ≈ ft_expected rtol = 1e-10

    println("Test udany, wynik: ", ft)
end

function test_naturalna()
    x = [3.0, 1.0, 5.0, 6.0]
    f = [1.0, -3.0, 2.0, 4.0]

    a_expected = [-8.75, 7.525, -1.95, 0.175]

    fx = ilorazyRoznicowe(x, f)

    a = naturalna(x, fx)

    @test a ≈ a_expected rtol = 1e-10

    println("Test udany, wynik: ", a)
end

function test_rysujNnfx()
    f(x) = sin(x)
    
    for n in [1, 3, 5, 7, 10, 15]
        plot_t = rysujNnfx(f, 0.0, 4pi, n)
        savefig(plot_t, "test_4_n_$n.png")
    end
    println("Test udany, wykresy utworzone")
end

test_ilorazyRoznicowe()
test_warNewton()
test_naturalna()
test_rysujNnfx()