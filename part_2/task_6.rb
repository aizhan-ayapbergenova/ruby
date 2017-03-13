# Сумма покупок

cart = {} # Хэш для корзины товаров с ценой и количеством
item_amount = {} # Хэш для товара и его итоговой цены

loop do

  item_info = {} # Вложенный хэш для цены и количества товара

  puts "Для выхода введите слово 'стоп' (без кавычек)."
  puts "Название товара?"
  item_name = gets.chomp.downcase.to_sym

  break if item_name == "стоп".to_sym

  puts "Цена товара?"
  item_price = gets.chomp.to_f

  puts "Количество товара?"
  item_quantity = gets.chomp.to_f

  item_info[:price]    = item_price
  item_info[:quantity] = item_quantity
  cart[item_name]      = item_info

end

total = 0

cart.each do |name, info|
    item_amount[name] = info[:price] * info[:quantity]
    total = item_amount.values.reduce(:+) 
end

puts "Получившийся хэш товаров: #{cart}"
puts "Товар и его итоговая цена: "
item_amount.each { |item, price| puts "#{item}: #{price}"}
puts "Итоговая сумма всех товаров в корзине: #{total}"