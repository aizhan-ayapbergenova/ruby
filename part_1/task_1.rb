# Идеальный вес

puts "Ваше имя?"
name = gets.chomp

puts "Ваш рост?"
height = gets.chomp.to_i

perfect_weight = height - 110

if perfect_weight <= 0
  puts "Ваш вес уже оптимальный"
else 
  puts "#{name}, ваш идеальный вес - #{perfect_weight} кг."
end