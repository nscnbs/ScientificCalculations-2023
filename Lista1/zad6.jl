#Autor: Illia Azler 239537

function f(x::Float64)
  return sqrt(x^2 + 1.0) - 1.0
end

function g(x::Float64)
  x^2 / (sqrt(x^2 + 1.0) + 1.0)
end

for i in 1:10
  x = 8.0^(-i)
  println("x = $x")
  println("f(x) = $(f(x))")
  println("g(x) = $(g(x))")
end