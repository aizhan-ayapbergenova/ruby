# Прямоугольный треугольник
<<<<<<< HEAD
=======

### Сначала хотел сделать только на основе пройденного материала,
### но получилось не очень красиво

puts "1-я сторона треугольника?"
a = gets.chomp.to_i
>>>>>>> 52dc0ba744fc7da22624e63c6f49fcbc6e45939d

sides = []

puts "1-я сторона треугольника?"
sides << a = gets.chomp.to_f

puts "2-я сторона треугольника?"
sides << b = gets.chomp.to_f

puts "3-я сторона треугольника?"
sides << c = gets.chomp.to_f

sides.sort!

hypotenuse  = sides[2]
second_side = sides[1]
third_side  = sides[0]

if hypotenuse == second_side && hypotenuse == third_side
  puts "Треугольник равносторонний"
elsif hypotenuse ** 2 == second_side ** 2 + third_side ** 2 && second_side == third_side
  puts "Треугольник прямоугольный и равнобедренный"
elsif hypotenuse ** 2 == second_side ** 2 + third_side ** 2
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не прямоугольный"
end
