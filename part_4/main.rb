require_relative 'application'

class Init < Application

  def start
    loop do
      puts "-----------------------------------------"
      puts "1. Создать станцию"
      puts "2. Создать поезд"
      puts "3. Создать маршрут"
      puts "4. Добавить станцию в маршрут"
      puts "5. Удалить станцию из маршрута"
      puts "6. Назначить маршрут поезду"
      puts "7. Прицепить вагон"
      puts "8. Отцепить вагон"
      puts "9. Переместить поезд на следующую станцию"
      puts "10. Переместить поезд на предыдущю станцию"
      puts "11. Посмотреть список станций"
      puts "12. Посмотреть список поездов на станции"
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
      when 4
        route_add
      when 5
        route_remove
      when 6
        set_route
      when 7
        attach_railcar
      when 8
        unhook_railcar
      when 9
        train_forward
      when 10
        train_backward
      end
    end
  end

end

app = Init.new

puts app.start