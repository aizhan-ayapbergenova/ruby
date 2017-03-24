require_relative 'station'
require_relative 'route'
require_relative 'trains'
require_relative 'railcars'

module Application

  attr_reader :stations, :route, :train

  def initialize
    @route
    @train
    @stations = []
  end

  def create_station
    puts "Station name:"
    @stations << Station.new(gets.chomp)
  end

  def create_train
    puts "1. Passenger Train"
    puts "2. Cargo Train"
    train_type = gets.to_i

    puts "Train number:"
    train_number = gets.chomp
    
    @train = PassengerTrain.new(train_number) if train_type == 1
    @train = CargoTrain.new(train_number)     if train_type == 2
  end

  def route_create
    station_list
    puts "First station number:"
    first_station = @station_list[gets.to_i]
    puts "Last station number:"
    last_station  = @station_list[gets.to_i]

    @route = Route.new(first_station, last_station)
  end

  def route_add
    station_list
    puts "Station number:"
    number = gets.to_i
    @route.add_station(@station_list[number])
  end

  def route_remove
    route_list
    puts "Station number:"
    number = gets.to_i
    @route.remove_station(@route_stations[number])
  end

  def set_route
    @train.route = @route
  end

  def attach_railcar
    @train.attach_railcar(PassengerRailcar.new) if @train.type == "passenger"
    @train.attach_railcar(CargoRailcar.new)     if @train.type == "cargo"
  end

  def unhook_railcar
    @train.unhook_railcar
  end

  def train_forward
    @train.forward
  end

  def train_backward
    @train.backward
  end

  def train_list
    station_list
    puts "Station number:"
    number = gets.to_i
    puts "Train's type:" 
    puts "1. Passenger Trains" 
    puts "2. Cargo Trains"
    type = gets.to_i 
 
    train_type = "passenger" if type == 1 
    train_type = "cargo"     if type == 2 
 
    puts @station_list[number].trains(train_type)
  end

  def station_list
    @station_list = {}
    @stations.each.with_index(1) { |station, index| @station_list[index] = station }

    puts "Available stations:"
    @station_list.each { |index, station| puts "#{index}. #{station.name}" }
  end

  private

  def route_list # метод используется только в рамках этого модуля
    @route_stations = {}
    @route.stations.each.with_index(1) { |station, index| @route_stations[index] = station }

    puts "Stations in the route:"
    @route_stations.each { |index, station| puts "#{index}. #{station.name}" }
  end
end