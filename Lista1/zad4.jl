#Autor: Illia Azler 239537

function find_x_not_equal_to_1()
    for x in 1.0000000000000001:0.0000000000000001:1.9999999999999999
        if x * (1 / x) != 1
            println("Znaleziono liczbę x: ", x)
            break
        end
    end
end

find_x_not_equal_to_1()
