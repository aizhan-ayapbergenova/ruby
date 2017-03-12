# Заполнить массив числами фибоначчи до 100

array = []

array << count = 0
array << index = 1

loop do
  index += 1
  count = array[index - 1] + array[index - 2]
  break if count > 100
  array << count
end

p array