# Autor Illia Azler 239537
module blocksys

import SparseArrays
using SparseArrays
using LinearAlgebra

export read_matrix, read_vector, compute_b, write_solution, write_solution_error, gauss_elim, gauss_elim_pp, find_lu, solve_lu, find_lu_pp, solve_lu_pp, solve_tridiagonal_system


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

        for line in eachline(f)
            line = split(line)
            push!(i, parse(Int64, line[1]))
            push!(j, parse(Int64, line[2]))
            push!(val, parse(Float64, line[3]))
        end
        A = SparseArrays.sparse(i, j, val)
        return (A, n, l_val)
    end
end

function read_vector(file)
    f = open(file, "r")
    n = parse(Int64, readline(f))

    b = zeros(Float64, n)
    for i in 1:n
        b[i] = parse(Float64, readline(f))
    end

    close(f)
    return b
end

function compute_b(A::SparseArrays.SparseMatrixCSC{Float64,Int64}, n::Int64, l::Int64)
    b = zeros(Float64, n)

    for i in 1:n
        for j in max(1, i - (2 + l)):min(n, i + l)
            b[i] += A[i, j]
        end
    end

    return b
end

function write_solution(filename, x::Vector{Float64})
    file = open(filename, "w")

    for i in 1:length(x)
        write(file, "x[$i] = $(x[i])\n")
    end

    close(file)
end

function relativeError(x::Vector)
    n = length(x)
    return (norm(ones(n) - x) / norm(ones(n)))
end


# Funkcja do zapisywania rozwiązania wraz z błędem do pliku
function write_solution_error(filename, x)
    file = open(filename, "w")

    error = relativeError(x)

    write(file, "blad = $error\n")
    for i in 1:length(x)
        write(file, "x[$i] = $(x[i])\n")
    end

    close(file)
end


function gauss_elim(A::SparseArrays.SparseMatrixCSC{Float64,Int64}, n::Int64, l::Int64, b::Vector{Float64})
    x = zeros(Float64, n)

    for k in 1:n-1
        for i in (k+1):min(n, k + l + 1)
            z = A[i, k] / A[k, k]
            A[i, k] = 0.0
            for j in (k+1):min(n, k + l)
                A[i, j] -= z * A[k, j]
            end
            b[i] -= z * b[k]
        end
    end

    for i in n:-1:1
        sum = 0.0
        for j in (i+1):min(n, i + l)
            sum += A[i, j] * x[j]
        end
        x[i] = (b[i] - sum) / A[i, i]
    end

    return x
end

function gauss_elim_pp(A::SparseArrays.SparseMatrixCSC{Float64,Int64}, n::Int64, l::Int64, b::Vector{Float64})
    x = zeros(Float64, n)
    p = [1:n...]


    for k in 1:n-1
        max_val = 0.0
        max_index = 0.0
        for i in k:min(n, k + l + 1)
            if abs(A[p[i], k]) > max_val
                max_val = abs(A[p[i], k])
                if max_val == 0.0
                    error("Macierz jest osobliwa")
                end
                max_index = i
            end
        end

        p[max_index], p[k] = p[k], p[max_index]

        for i in (k+1):min(n, k + l + 1)
            z = A[p[i], k] / A[p[k], k]
            A[p[i], k] = 0.0
            for j in (k+1):min(n, k + 2 * l)
                A[p[i], j] -= z * A[p[k], j]
            end
            b[p[i]] -= z * b[p[k]]
        end
    end

    for i in n:-1:1
        sum = 0.0
        for j in (i+1):min(n, i + 2 * l)
            sum += A[p[i], j] * x[j]
        end
        x[i] = (b[p[i]] - sum) / A[p[i], i]
    end

    return x
end

function find_lu(U::SparseArrays.SparseMatrixCSC{Float64,Int64}, n::Int64, l::Int64)
    L = spzeros(n, n)

    for k in 1:(n-1)
        L[k, k] = 1.0

        for i in (k+1):min(n, k + l + 1)
            z = U[i, k] / U[k, k]
            L[i, k] = z
            U[i, k] = 0.0
            for j in (k+1):min(n, k + 2 * l)
                U[i, j] -= z * U[k, j]
            end
        end
    end
    L[n, n] = 1.0

    return (L, U)
end


function solve_lu(L::SparseArrays.SparseMatrixCSC{Float64,Int64}, U::SparseArrays.SparseMatrixCSC{Float64,Int64}, n::Int64, l::Int64, b::Vector{Float64})
    x = zeros(Float64, n)

    for k in 1:(n-1)
        for i in (k+1):min(n, k + l + 1)
            b[i] -= L[i, k] * b[k]
        end
    end

    for i in n:-1:1
        sum = 0.0
        for j in (i+1):min(n, i + l)
            sum += U[i, j] * x[j]
        end

        x[i] = (b[i] - sum) / U[i, i]
    end

    return x
end



function find_lu_pp(U::SparseArrays.SparseMatrixCSC{Float64,Int64}, n::Int64, l::Int64)
    L = spzeros(n, n)
    p = [1:n...]


    for k in 1:n-1
        max_val = 0.0
        max_index = 0.0
        for i in k:min(n, k + l + 1)
            if abs(U[p[i], k]) > max_val
                max_val = abs(U[p[i], k])
                if max_val == 0.0
                    error("Macierz jest osobliwa")
                end
                max_index = i
            end
        end

        p[max_index], p[k] = p[k], p[max_index]

        for i in (k+1):min(n, k + l + 1)
            z = U[p[i], k] / U[p[k], k]

            L[p[i], k] = z
            U[p[i], k] = 0.0

            for j in (k+1):min(n, k + 2 * l)
                U[p[i], j] -= z * U[p[k], j]
            end
        end
    end

    return (L, U, p)
end


function solve_lu_pp(L::SparseMatrixCSC, U::SparseMatrixCSC, n::Int64, l::Int64, b::Vector, p::Vector)
    x = zeros(Float64, n)

    for k in 1:n-1
        for i in (k+1):min(n, k + l + 1)
            b[p[i]] -= L[p[i], k] * b[p[k]]
        end
    end

    for i in n:-1:1
        sum = 0.0
        for j in (i+1):min(n, i + 2 * l)
            sum += U[p[i], j] * x[j]
        end

        x[i] = (b[p[i]] - sum) / U[p[i], i]
    end

    return x
end



function solve_tridiagonal_system(A, B)
    n = length(B)

    # Inicjalizacja zmiennych pomocniczych
    alpha = zeros(n)
    beta = zeros(n - 1)
    x = zeros(n)

    if n == 0
        return x
    end

    # Obsługa macierzy trójprzekątnej
    if n > 1
        alpha[1] = A[1, 1]
        for i in 2:n
            denom = A[i, i-1]
            alpha[i] = A[i, i] - (denom^2) / alpha[i-1]
            beta[i-1] = A[i, i-1] / alpha[i-1]
        end

        # Obliczenia rozwiązania x
        x[1] = B[1] / alpha[1]
        for i in 2:n
            x[i] = (B[i] - beta[i-1] * x[i-1]) / alpha[i]
        end

        # Zastosowanie algorytmu Thomasa do rozwiązania układu równań trójprzekątniowego
        for i in (n-1):-1:1
            x[i] = x[i] - beta[i] * x[i+1]
        end
    else
        # Obsługa przypadku dla n=1 (macierz 1x1)
        alpha[1] = A[1, 1]
        x[1] = B[1] / alpha[1]
    end

    return x
end


end