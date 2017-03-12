# Заполнить массив числами фибоначчи до 100

array = [0, 1]
index = 2

while (count = array[index-1] + array[index-2]) < 100
  array << count
  index += 1
end

p array