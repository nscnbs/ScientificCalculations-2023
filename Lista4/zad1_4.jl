#Autor: Illia Azler 239537

module Metody
using Plots

export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    n = length(f)
    fx = Vector{Float64}(undef, n)

    for i in range(1, n)
        fx[i] = f[i]
    end
    for j in range(2, n)
        for i in n:-1:j
            fx[i] = (fx[i] - fx[i-1]) / (x[i] - x[i-j+1])
        end
    end
    return fx
end

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    n = length(x)
    nt = fx[n]
    for i = n-1:-1:1
        nt = nt * (t - x[i]) + fx[i]
    end
    return nt
end

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    n = length(fx)
    a = zeros(n)
    a[n] = fx[n]
    for k in n-1:(-1):1
        a[k] = fx[k] - a[k+1] * x[k]
        for i = k+1:n-1
            a[i] += -x[k] * a[i+1]
        end
    end
    return a
end

function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    x = zeros(n + 1)
    y = zeros(n + 1)
    h = (b - a) / n
    for i in 0:n
        x[i+1] = a + i * h
        y[i+1] = f(x[i+1])
    end
    c = ilorazyRoznicowe(x, y)

    points = 200 * (n + 1)
    dx = (b - a) / (points - 1)
    xp = zeros(points)
    p = zeros(points)
    fx = zeros(points)
    xp[1] = a
    p[1] = fx[1] = y[1]
    for j in 2:points
        xp[j] = xp[j-1] + dx
        p[j] = warNewton(x, c, xp[j])
        fx[j] = f(xp[j])
    end
    plot(xp, [p fx], label=["p(x)" "f(x)"], title="dla n = $n")
end

end
