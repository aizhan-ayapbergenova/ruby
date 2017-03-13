# Заполнить массив числами фибоначчи до 100

array = [0, 1]

while (count = array[-1] + array[-2]) < 100
  array << count
end

p array