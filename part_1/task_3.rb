### Сначала хотел сделать только на основе пройденного материала,
### но получилось не очень красиво

# puts "1-я сторона треугольника?"
# a = gets.chomp.to_i

# Прямоугольный треугольник

puts "2-я сторона треугольника?"
b = gets.chomp.to_i

puts "3-я сторона треугольника?"
c = gets.chomp.to_i

puts "Треугольник равносторонний" if a == b && b == c

if a**2 == b**2 + c**2 && b == c
  puts "Треугольник прямоугольный и равнобедренный"
elsif a**2 == b**2 + c**2 && b != c
  puts "Треугольник прямоугольный"
elsif b**2 == a**2 + c**2 && a == c
  puts "Треугольник прямоугольный и равнобедренный"
elsif b**2 == a**2 + c**2 && a != c
  puts "Треугольник прямоугольный"
elsif c**2 == a**2 + b**2 && a == b
  puts "Треугольник прямоугольный и равнобедренный"
elsif c**2 == a**2 + b**2 && a != b
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не прямоугольный"
end

### Попробовал решить другим, более лаконичным способом

puts "1-я сторона треугольника?"
a = gets.chomp

puts "2-я сторона треугольника?"
b = gets.chomp

puts "3-я сторона треугольника?"
c = gets.chomp

lengths = [].push(a, b, c).sort.reverse # Помещаем переменные в массив, сортируем, обращаем

hypotenuse  = lengths[0].to_f # Первый элемент максимальный, т.е - гипотенуза
second_side = lengths[1].to_f
third_side  = lengths[2].to_f

if hypotenuse == second_side && hypotenuse == third_side
  puts "Треугольник равносторонний"
elsif hypotenuse == Math.sqrt(second_side ** 2 + third_side ** 2) && second_side == third_side
  puts "Треугольник прямоугольный и равнобедренный"
elsif hypotenuse == Math.sqrt(second_side ** 2 + third_side ** 2) && second_side != third_side
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не прямоугольный"
end