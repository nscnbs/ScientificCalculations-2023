#Autor: Illia Azler 239537

module Metody

export mbisekcji, mstycznych, msiecznych


function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    u = f(a)    # wartość f w punkcie a (początek przedziału)
    v = f(b)    # wartość f w punkcie b (koniec przedziału)
    e = b - a   # długość (a, b)
    it = 0      # liczba iteracji
    if (sign(u) == sign(v)) # funkcja nie zmienia znaku w przedziale [a,b]
        return 0, 0, 0, 1
    end

    while e > epsilon
        it += 1
        e = e / 2   # połowa długości przedziału
        c = a + e   # środek przedziału
        w = f(c)    # wartość f w środku przedziału

        if (abs(e) < delta || abs(w) < epsilon) # warunek końca
            return c, w, it, 0
        end

        if (sign(w) != sign(u))
            b = c
            v = w
        else
            a = c
            u = w
        end
    end
end

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)
    if abs(v) < epsilon
        return x0, v, 0, 0
    end

    for it in 1:maxit
        if abs(pf(x0)) < epsilon
            return x0, v, it, 2
        end

        x1 = x0 - v / pf(x0)
        v = f(x1)
        if abs(x1 - x0) < delta || abs(v) < epsilon
            return x1, v, it, 0
        end
        x0 = x1
    end
    return x0, v, maxit, 1
end

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    fa = f(x0)
    fb = f(x1)
    for it in 1:maxit
        if abs(fa) < abs(fb)
            x0, x1 = x1, x0
            fa, fb = fb, fa
        end
        s = (x1 - x0) / (fb - fa)
        x0 = x1
        fa = fb
        x1 = x1 - fa * s
        fb = f(x1)
        if abs(x1 - x0) < delta || abs(fb) < epsilon
            return x1, fb, it, 0
        end
    end
    return x1, fb, maxit, 1
end


end


