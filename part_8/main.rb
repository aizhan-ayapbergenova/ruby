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
      options
      choice = gets.to_i
      break if choice.zero?

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
        all_stations
      when 13
        show_trains
      when 14
        show_railcars
      when 15
        reserve_seat
      when 16
        fill_railcar
      else
        puts 'Enter the valid number'
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

  def options
    puts [
      '1. Create a station',
      '2. Create a train',
      '3. Create a route',
      '4. Add station to the route',
      '5. Remove station from the route',
      '6. Set route for the train',
      '7. Create railcar',
      '8. Attach railcar',
      '9. Unhook railcar',
      '10. Move train to the next station',
      '11. Move train to the previous station',
      '12. See the stations list',
      '13. See the trains list',
      '14. See the railcars info',
      '15. Reserve a seat',
      '16. Fill railcar',
      '0. Exit'
    ]
  end

  def create_station
    puts 'Station name:'
    @stations << Station.new(gets.chomp)
  rescue => @error
    error_output
    retry
  end

  def create_train
    puts '1. Passenger Train'
    puts '2. Cargo Train'
    train_type = gets.to_i
    wrong_number if train_type <= 0 || train_type > 2

    puts 'Train number:'
    train_number = gets.chomp

    @trains << PassengerTrain.new(train_number) if train_type == 1
    @trains << CargoTrain.new(train_number) if train_type == 2
    puts "The train №#{train_number} successfully created"
  rescue => @error
    error_output
    retry
  end

  def route_create
    puts 'Available stations:'
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
    puts 'First station number:'
    first = gets.to_i - 1
    puts 'Last station number:'
    last = gets.to_i - 1

    wrong_number if first < 0 || first > @stations.size - 1
    wrong_number if last < 0 || last > @stations.size - 1

    first_station = @stations[first]
    last_station = @stations[last]
    @routes << Route.new(first_station, last_station)
  rescue => @error
    error_output
    retry
  end

  def route_add
    route_list
    station_list
    @routes[@route].add_station(@stations[station])
  rescue => @error
    error_output
    retry
  end

  def route_remove
    route_list
    puts 'Stations in the route:'
    @routes[@route].stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
    puts 'Station number:'
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
    puts 'Railcar type:'
    puts '1. Passenger Railcar'
    puts '2. Cargo Railcar'
    type = gets.to_i

    if type == 1
      puts 'Amount of seats:'
      seats = gets.to_i
      @railcars << PassengerRailcar.new(seats)
    elsif type == 2
      puts 'Railcar volume:'
      volume = gets.to_f
      @railcars << CargoRailcar.new(volume)
    else
      wrong_number
    end
  rescue => @error
    error_output
    retry
  end

  def attach_railcar
    puts 'Available railcars:'
    @railcars.each_with_index(&railcar_info)
    puts 'Railcar:'
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

  def reserve_seat
    railcar_action('PassengerTrain')
    @trains[@train].railcars[@railcar].take_seat
  end

  def fill_railcar
    railcar_action('CargoTrain')
    puts 'Volume:'
    volume = gets.to_f
    @trains[@train].railcars[@railcar].fill(volume)
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
    @stations[@number].pass_train(&train_info)
  end

  def show_railcars
    show_trains
    puts 'Train:'
    @train = gets.to_i - 1
    @trains[@train].pass_railcar(&railcar_info)
  end

  def train_list
    puts 'Available trains:'
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train}" }
    puts 'Train:'
    @train = gets.to_i - 1

    wrong_number if @train < 0 || @train > @trains.size - 1
  end

  def station_list
    all_stations
    puts 'Station number:'
    @number = gets.to_i - 1

    wrong_number if @number < 0 || @number > @stations.size - 1
  end

  def route_list
    puts 'Available routes'
    @routes.each.with_index(1) { |route, index| puts "#{index}. #{route}" }
    puts 'Route:'
    @route = gets.to_i - 1

    wrong_number if @route < 0 || @route > @routes.size - 1
  end

  def all_stations
    puts 'Available stations:'
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
  end

  def railcar_info
    proc do |railcar, index|
      index += 1
      info = "#{index}. Railcar №#{railcar.number}. Type: #{railcar.class}."
      if railcar.class.to_s == 'PassengerRailcar'
        puts info + "Available seats: #{railcar.free_seats}."\
        " Reserved seats: #{railcar.reserved_seats}"
      else
        puts info + "Available volume: #{railcar.free_volume}."\
        " Taken volume: #{railcar.filled_volume}"
      end
    end
  end

  def train_info
    proc do |train, index|
      index += 1
      puts "#{index}. Train №#{train.number}. Type: #{train.class}."\
      " Amount of railcars: #{train.railcars.size}"
    end
  end

  def railcar_action(type)
    station_list
    type_train = @stations[@number].station_trains(type)
    type_train.each_with_index(&train_info)
    puts 'Train:'
    @train = gets.to_i - 1
    wrong_number if @train < 0 || @train > type_train.size

    @trains[@train].pass_railcar(&railcar_info)
    puts 'Railcar:'
    @railcar = gets.to_i - 1
    wrong_number if @railcar < 0 || @railcar > @trains.size
  end

  def error_output
    puts "ERROR: #{@error.message}"
  end

  def wrong_number
    raise 'Enter the valid number'
  end
end

App.new.start
