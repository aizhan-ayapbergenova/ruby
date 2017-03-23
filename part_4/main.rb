require_relative 'application'

class Init < Application

  def start
    loop do
      puts "-----------------------------------------"
      puts "1. Create a station"
      puts "2. Create a train"
      puts "3. Create a route"
      puts "4. Add station to the route"
      puts "5. Remove station from the route"
      puts "6. Set route for the train"
      puts "7. Attach railcar"
      puts "8. Unhook railcar"
      puts "9. Move train to the next station"
      puts "10. Move train to the previous station"
      puts "11. See the stations list"
      puts "12. See the trains list"
      puts "0. Exit"
      puts "-----------------------------------------"
      choice = gets.to_i
      break if choice == 0

      case choice
      when 1
        create_station
      when 2
        create_train
      when 3
        route_create
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
      when 11
        station_list
      when 12
        train_list
      else
        "Enter the number"
      end
    end
  end
  
end

app = Init.new

puts app.start