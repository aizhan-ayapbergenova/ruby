# Квадратное уравнение

puts "Коэффициент a"
a = gets.chomp.to_f

puts "Коэффициент b"
b = gets.chomp.to_f

puts "Коэффициент c"
c = gets.chomp.to_f

d = b ** 2 - (4 * a * c) # Вычисляем дискриминант

# Вычисляем корни, если они есть

if d < 0
  puts "Корней нет. Дискриминант равен #{d}"
elsif d > 0
  d_sqrt = Math.sqrt(d)
  x1 = (-b + d_sqrt) / 2 * a
  x2 = (-b - d_sqrt) / 2 * a
  puts "Дискриминант равен #{d}, корни уравнения равны: X1 = #{x1}, X2 = #{x2}"
elsif d == 0
  x  =  (-b) / 2 * a
  puts "Дискриминант равен #{d}, корень уравнения X = #{x}"
end