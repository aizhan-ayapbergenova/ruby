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
  @error
  def start
    loop do
      puts "-----------------------------------------"
      puts "1. Create a station"
      puts "2. Create a train"
      puts "3. Create a route"
      puts "4. Add station to the route"
      puts "5. Remove station from the route"
      puts "6. Set route for the train"
      puts "7. Create railcar"
      puts "8. Attach railcar"
      puts "9. Unhook railcar"
      puts "10. Move train to the next station"
      puts "11. Move train to the previous station"
      puts "12. See the stations list"
      puts "13. See the trains list"
      puts "14. See the trains info"
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
        create_railcar
      when 8
        attach_railcar
      when 9
        unhook_railcar
      when 10
        train_forward
      when 11
        train_backward
      when 12
        station_list
      when 13
        show_trains
      when 14
        trains_info
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
    @railcars = []
  end

  def create_station
    puts "Station name:"
    @stations << Station.new(gets.chomp)

  rescue => @error
    error_output
    retry
  end

  def create_train
    puts "1. Passenger Train"
    puts "2. Cargo Train"
    train_type = gets.to_i

    wrong_number if train_type <= 0 || train_type > 2
      
    puts "Train number:"
    train_number = gets.chomp

    @trains << PassengerTrain.new(train_number) if train_type == 1
    @trains << CargoTrain.new(train_number)  if train_type == 2 

    puts "The train №#{train_number} successfully created"

  rescue => @error
    error_output
    retry
  end

  def route_create
    station_list
    puts "First station number:"
    first = gets.to_i - 1
    puts "Last station number:"
    last  = gets.to_i - 1

    wrong_number if first < 0 || first > @stations.size - 1
    wrong_number if last < 0 || last > @stations.size - 1

    first_station = @stations[first]
    last_station  = @stations[last]
    @routes << Route.new(first_station, last_station)

  rescue => @error
    error_output
    retry
  end

  def route_add
    route_list

    station_list
    puts "Station:"
    station = gets.to_i - 1

    wrong_number if @route < 0 || @route > @routes.size - 1
    wrong_number if station < 0 || station > @stations.size - 1
      
    @routes[@route].add_station(@stations[station])

  rescue => @error
    error_output
    retry
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

  def create_railcar
    puts "Railcar type:"
    puts "1. Passenger Railcar"
    puts "2. Cargo Railcar"
    type = gets.to_i

    if type == 1
      puts "Amount of seats:"
      seats = gets.to_i
      @railcars << PassengerRailcar.new(seats)
    elsif type == 2
      puts "Railcar volume:"
      volume = gets.to_i
      @railcars << CargoRailcar.new(volume)
    else
      wrong_number
    end

  rescue => @error
    error_output
    retry
  end

  def attach_railcar
    puts "Available railcars:"
    @railcars.each.with_index(1) { |railcar, index| puts "#{index}. #{railcar}" }
    puts "Railcar:"
    railcar = @railcars[gets.to_i - 1]

    train_list

    @trains[@train].attach_railcar(railcar)

  rescue => @error
    error_output
    retry
  end

  def unhook_railcar
    train_list

    @trains[@train].unhook_railcar
  end

  def train_forward
    train_list

    @trains[@train].railcars.each
  end

  def train_backward
    train_list

    @trains[@train].backward
  end

  def show_trains
    station_list
    puts "Station number:"
    number = gets.to_i - 1

    @stations[number].pass_train do |train; index|
      index = 0
      puts "#{index += 1}. Train №#{train.number}. Type: #{train.class.to_s}. Amount of railcars: #{train.railcars.size}"
    end
  end

  def trains_info
    train_list

    @trains[@train].pass_railcar do |railcar|
      railcar_info = "Railcar №#{railcar.number}. Type: #{railcar.class.to_s}. "
      if railcar.class.to_s == "PassengerRailcar"
        puts railcar_info + "Available seats: #{railcar.free_seats}. Reserved seats: #{railcar.reserved_seats}"
      else
        puts railcar_info + "Available volume: #{railcar.free_volume}. Taken volume: #{railcar.taken_volume}"
      end
    end
  end

  def train_list
    puts "Available trains:"
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train}" }
    puts "Train:"
    @train = gets.to_i - 1

    wrong_number if @train < 0 || @train > @trains.size - 1
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

  def error_output
    puts "ERROR: #{@error.message}"
  end

  def wrong_number
    raise "Enter the valid number"
  end
end

App.new.start