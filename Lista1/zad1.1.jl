#Autor: Illia Azler 239537

function find_eps(T)
    mach_eps = T(1.0)
    while T(1.0) + mach_eps / 2 > T(1.0)
        mach_eps /= 2
    end
    return mach_eps
end

for i in [Float16, Float32, Float64]
    println(i, '\n', "Macheps (Calculated): ", find_eps(i), '\n', "Macheps (Julia): ", eps(i), '\n')
end

#println("Float16 Machine Epsilon (Calculated): ", find_eps(Float16))
#println("Float32 Machine Epsilon (Calculated): ", find_eps(Float32))
#println("Float64 Machine Epsilon (Calculated): ", find_eps(Float64))

#println("Float16 Machine Epsilon (Julia Function): ", eps(Float16))
#println("Float32 Machine Epsilon (Julia Function): ", eps(Float32))
#println("Float64 Machine Epsilon (Julia Function): ", eps(Float64))
