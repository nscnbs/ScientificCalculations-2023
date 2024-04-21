# Autor Illia Azler 239537
include("D:\\Studia\\V sem\\ON\\Lista5\\blocksys.jl")

using .blocksys
import SparseArrays
using SparseArrays
using LinearAlgebra


function test_main()
    println("etap 1 wczytywanie")
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A100.txt")
    println("etap 2 generacja b")
    b = compute_b(A, n, l)

    #b = read_vector("D:\\Studia\\V sem\\ON\\Lista5\\b100.txt")
    #println("$b")
    #b = read_vector("D:\\Studia\\V sem\\ON\\Lista5\\b16.txt")

    #println("Vector b:")
    #println(b)
    println("etap 3 classic")
    x_k = gauss_elim(A, n, l, b)
    println("etap 3 pp")
    x_pp = gauss_elim_pp(A, n, l, b)
    println("etap 4 write")
    write_solution_error("D:\\Studia\\V sem\\ON\\Lista5\\gauss100000_x_blad.txt", x_k)
    write_solution_error("D:\\Studia\\V sem\\ON\\Lista5\\gauss100000_pp_x_blad.txt", x_pp)
    println("DONE")

end

function test_matrix()
    # Wczytanie macierzy A z pliku
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A16.txt")

    # Print the matrix A
    println("Matrix A:")
    println(A)

    println("n: $n")
    println("l: $l")

    # Wczytanie wektora b z pliku
    b = read_vector("D:\\Studia\\V sem\\ON\\Lista5\\b16.txt")

    println("Vector b:")
    println(b)
end

function test_compute_b()
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A3.txt")
    b = compute_b(A, n, l)

    println("Vector b:")
    println(b)
end

function test_gauss_elimination(terminal=false)
    println("etap 1 r")
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A3.txt")
    println("etap 2 b")
    b = compute_b(A, n, l)
    #b = read_vector("D:\\Studia\\V sem\\ON\\Lista5\\b100.txt")
    println("etap 3 gauss")
    x = gauss_elim(A, n, l, b)
    if terminal
        println("Rozwiązanie z funkcji gauss_elimination bez wyboru elementu głównego: $x")
    end
    println("etap 4 w")
    #write_solution("D:\\Studia\\V sem\\ON\\Lista5\\gauss_x_100000.txt", x)
    write_solution_error("D:\\Studia\\V sem\\ON\\Lista5\\gauss_x_blad_3.txt", x)
    println("DONE")
end

function test_gauss_elimination_pp(terminal=false)
    println("etap 1 r")
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A100.txt")
    println("etap 2 b")
    b = compute_b(A, n, l)
    #b = read_vector("D:\\Studia\\V sem\\ON\\Lista5\\b100.txt")
    println("etap 3 gauss pp")
    x = gauss_elim_pp(A, n, l, b)
    if terminal
        println("Rozwiązanie z funkcji gauss_elimination z wyborem elementu głównego: $x")
    end
    println("etap 4 w")
    #write_solution("D:\\Studia\\V sem\\ON\\Lista5\\gauss_pp_x_100000.txt", x)
    write_solution_error("D:\\Studia\\V sem\\ON\\Lista5\\gauss_pp_x_blad_100000.txt", x)
    println("DONE")
end

function test_lu(terminal=false)
    println("etap 1 r")
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A3.txt")
    println("etap 2 b")
    b = compute_b(A, n, l)
    #b = read_vector("D:\\Studia\\V sem\\ON\\Lista5\\b100.txt")
    println("etap 3 lu")
    L, U = find_lu(A, n, l)
    println("etap 4 x")
    x = solve_lu(L, U, n, l, b)
    if terminal
        println("Rozwiązanie z funkcji lu bez wyboru elementu głównego: $x")
    end
    println("etap 5 w")
    #write_solution("D:\\Studia\\V sem\\ON\\Lista5\\lu_x.txt", x)
    write_solution_error("D:\\Studia\\V sem\\ON\\Lista5\\lu_x_blad_1000000.txt", x)
    println("DONE")
end


function test_lu_pp(terminal=false)
    println("etap 1 r")
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A100.txt")
    println("etap 2 b")
    b = compute_b(A, n, l)
    #b = read_vector("D:\\Studia\\V sem\\ON\\Lista5\\b100.txt")
    println("etap 3 lu pp")
    L, U, p = find_lu_pp(A, n, l)
    println("etap 4 x")
    x = solve_lu_pp(L, U, n, l, b, p)
    if terminal
        println("Rozwiązanie z funkcji lu z wyborem elementu głównego: $x")
    end
    println("etap 5 w")
    #write_solution("D:\\Studia\\V sem\\ON\\Lista5\\lu_x_pp.txt", x)
    write_solution_error("D:\\Studia\\V sem\\ON\\Lista5\\lu_x_pp_blad_100000.txt", x)
    println("DONE")
end

function test_tri()
    A, n, l = read_matrix("D:\\Studia\\V sem\\ON\\Lista5\\A3.txt")
    b = compute_b(A, n, l)
    x = solve_tridiagonal_system(A, b)
    println("Rozwiązanie: $x")
    println("DONE")
end

#test_main()
#test_matrix()
test_compute_b()
#test_gauss_elimination(true)
#test_gauss_elimination_pp()
#test_lu(true)
#test_lu_pp()
test_tri()
