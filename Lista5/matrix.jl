import SparseArrays
using SparseArrays

function solve_tridiagonal_system(A, B)
    n = length(B)

    # Inicjalizacja zmiennych pomocniczych
    alpha = zeros(n - 1)
    beta = zeros(n - 1)
    x = zeros(n)

    # Obliczenia współczynników alpha i beta
    for i in 1:n-1
        alpha[i] = A[i+1] / (A[i] - alpha[i-1] * A[i+1])
        beta[i] = (B[i+1] - beta[i-1] * A[i+1]) / (A[i] - alpha[i-1] * A[i+1])
    end

    # Obliczenia rozwiązania x
    x[n] = (B[n] - beta[n-1] * A[n-1]) / (A[n] - alpha[n-1] * A[n-1])
    for i in n-1:-1:1
        x[i] = beta[i] - alpha[i-1] * x[i+1]
    end

    return x
end


function compute_b(A::SparseArrays.SparseMatrixCSC{Float64,Int64}, n::Int64, l::Int64)
    b = zeros(Float64, n)

    for i in 1:n
        for j in max(1, i - (2 + l)):min(n, i + l)
            b[i] += A[i, j]
        end
    end

    println(b)

    return b
end


function read_matrix(file::String)
    open(file) do f
        n, l_val = split(readline(f))
        n, l_val = parse(Int64, n), parse(Int64, l_val)
        if n % l_val != 0
            close(file)
            error("n nie dzieli l")
        end

        i = Int64[]
        j = Int64[]
        val = Float64[]

        for (index, line) in enumerate(eachline(f))
            line = split(line)
            push!(i, index)
            push!(j, parse(Int64, line[1]))
            push!(val, parse(Float64, line[2]))
        end
        A = sparse(i, j, val)
        return (A, n, l_val)
    end
end

function test_tri()
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A3.txt")
    b = compute_b(A, n, l)
    x = solve_tridiagonal_system(A, b)
    println("Rozwiązanie: $x")
    println("DONE")
end


test_tri()
