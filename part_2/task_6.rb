# Сумма покупок

cart = {} # Хэш для корзины товаров с ценой и количеством
item_amount = {} # Хэш для товара и его итоговой цены

loop do

  item_info = {} # Вложенный хэш для цены и количества товара

  puts "Для выхода введите слово 'стоп' (без кавычек)."
  puts "Название товара?"
  item_name = gets.chomp.downcase

  break if item_name == "стоп"

  puts "Цена товара?"
  item_price = gets.chomp.to_f

  puts "Количество товара?"
  item_quantity = gets.chomp.to_f

  item_info["price"]    = item_price
  item_info["quantity"] = item_quantity
  cart[item_name]       = item_info

  cart.each do |name, info| # Помещаем каждый товар и его итоговую цену в раннее созданный хэш
    item_amount[name] = info["price"] * info["quantity"]
  end

end

sum = item_amount.values.reduce(:+) # Извлекаем итоговые цены каждого товара и суммируем их

puts "Получившийся хэш товаров: #{cart}"
puts "Товар и его итоговая цена: "
item_amount.each { |item, price| puts "#{item}: #{price}"}
puts "Итоговая сумма всех товаров в корзине: #{sum}"