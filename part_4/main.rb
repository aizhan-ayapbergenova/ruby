require_relative 'application'

class Init < Application

  def start
    loop do
      puts "-----------------------------------------"
      puts "1. Создать станцию"
      puts "2. Создать поезд"
      puts "3. Создать маршрут"
      puts "4. Добавить станцию в маршрут"
      puts "5. Назначить маршрут поезду"
      puts "6. Прицепить вагон"
      puts "7. Отцепить вагон"
      puts "8. Переместить поезд на следующую станцию"
      puts "9. Переместить поезд на предыдущю станцию"
      puts "10. Посмотреть список станций"
      puts "11. Посмотреть список поездов на станции"
      puts "0. Выйти"
      puts "-----------------------------------------"
      choice = gets.to_i
      break if choice == 0

      case choice
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      end
    end
  end

end

app = Init.new

puts app.start