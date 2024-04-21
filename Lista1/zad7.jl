#Autor: Illia Azler 239537

function df(f, h, x)
    (f(x + h) - f(x)) / h
end

f(x) = sin(x) + cos(3x)
df(x) = cos(x) - 3sin(3x)

df1 = df(1)

#for n in 0:54
#    h = 2.0^(-n)
#    ft = df(f, h, 1)
#    println("h = 2^-$n | f prim = $ft | blad $(abs(ft-df1))")
#end

#println("\n1+h\n")

#for n in [0:5; 25:30; 44:54]
for n in 0:54
    h = 2.0^(-n)
    ft = df(f, h, 1)
    println("1+h = $(h+1.0) | f(h+1) = $(f(1.0 + h)) | f(h+1) - f(1) = $(f(1.0 + h) - f(1.0))")
end