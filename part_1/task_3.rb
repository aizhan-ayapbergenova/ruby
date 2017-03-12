# Прямоугольный треугольник

sides = []

puts "1-я сторона треугольника?"
sides << gets.chomp.to_f

puts "2-я сторона треугольника?"
sides << gets.chomp.to_f

puts "3-я сторона треугольника?"
sides << gets.chomp.to_f

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
