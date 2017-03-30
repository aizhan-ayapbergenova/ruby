require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'railcar'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_railcar'
require_relative 'cargo_railcar'
require_relative 'instance_counter'

class App
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
        show_trains
      else
        puts "Enter the valid number"
      end
    end
  end

  private

  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @trains   = []
    @routes   = []
  end

  def create_station
    puts "Station name:"
    @stations << Station.new(gets.chomp)
  end

  def create_train
    puts "1. Passenger Train"
    puts "2. Cargo Train"
    train_type = gets.to_i

    if train_type <= 0 || train_type > 2
      puts "Enter the valid number"
    else
      puts "Train number:"
      train_number = gets.chomp
    end

    @trains << PassengerTrain.new(train_number) if train_type == 1
    @trains << CargoTrain.new(train_number)     if train_type == 2
  end

  def route_create
    station_list
    puts "First station number:"
    first = gets.to_i - 1
    puts "Last station number:"
    last  = gets.to_i - 1

    if first < 0 || first > @stations.size - 1
      puts "Error"
    elsif last < 0 || last > @stations.size - 1
      puts "Error"
    else
      first_station = @stations[first]
      last_station  = @stations[last]

      @routes << Route.new(first_station, last_station)
    end
  end

  def route_add
    route_list

    station_list
    puts "Station:"
    station = gets.to_i - 1

    if @route < 0 || @route > @routes.size - 1
      puts "Error"
    elsif station < 0 || station > @stations.size - 1
      puts "Error"
    else
      @routes[@route].add_station(@stations[station])
    end
  end

  def route_remove
    route_list

    puts "Stations in the route:"
    @routes[@route].stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
    puts "Station number:"
    number = gets.to_i - 1

    station_in_route = @routes[@route].stations[number]
    @routes[@route].remove_station(station_in_route)
  end

  def set_route
    train_list

    route_list

    @trains[@train].route = @routes[@route]
  end

  def attach_railcar
    train_list

    @trains[@train].attach_railcar(PassengerRailcar.new)
    @trains[@train].attach_railcar(CargoRailcar.new)
  end

  def unhook_railcar
    train_list

    @trains[@train].unhook_railcar
  end

  def train_forward
    train_list

    @trains[@train].forward
  end

  def train_backward
    train_list

    @trains[@train].backward
  end

  def show_trains
    station_list
    puts "Station number:"
    number = gets.to_i - 1
    puts "Train's type:" 
    puts "1. Passenger Trains" 
    puts "2. Cargo Trains"
    type = gets.to_i 
 
    train_type = "PassengerTrain" if type == 1 
    train_type = "CargoTrain"     if type == 2 
 
    puts @stations[number].station_trains(train_type)
  end

  def train_list
    puts "Available trains:"
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train}" }
    puts "Train:"
    @train = gets.to_i - 1

    puts "Error" if @train < 0 || @train > @trains.size - 1
  end

  def station_list
    puts "Available stations:"
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
  end

  def route_list
    puts "Available routes"
    @routes.each.with_index(1) { |route, index| puts "#{index}. #{route}" }
    puts "Route:"
    @route = gets.to_i - 1
  end
end

App.new.start