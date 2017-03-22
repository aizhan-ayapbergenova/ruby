require_relative 'station'
require_relative 'route'
require_relative 'trains'
require_relative 'railcars'


class Application

  attr_reader   :stations
  attr_accessor :station, :route, :train

  def initialize
    @station
    @route
    @train
    @stations = []
  end

  def create_station
    puts "Название станции:"
    @stations << Station.new(gets.chomp)
  end

  def create_train
    puts "1. Пассажирский поезд"
    puts "2. Грузовой поезд"
    train_type = gets.to_i

    puts "Номер поезда:"
    train_number = gets.chomp
    
    @train = PassengerTrain.new(train_number) if train_type == 1
    @train = CargoTrain.new(train_number) if train_type == 2
  end

  def route_create
    station_list
    puts "Номер начальной станции:"
    first_station = @station_list[gets.to_i]
    puts "Номер конечной станции:"
    last_station  = @station_list[gets.to_i]

    @route = Route.new(first_station, last_station)
  end

  def route_add
    unless @route.nil?
      station_list
      puts "Номер станции:"
      number = gets.to_i
      @route.add_station(@station_list[number])
    end
  end

  def route_remove
    unless @route.nil?
      route_list
      puts "Номер станции:"
      number = gets.to_i
      @route.remove_station(@route_stations[number])
    end
  end

  def set_route
    unless @train.nil?
      @train.route = @route
    end
  end

  def attach_railcar
    @train.attach_railcar(PassengerRailcar.new) if @train.type == "passenger"
    @train.attach_railcar(CargoRailcar.new) if @train.type == "cargo"
  end

  def unhook_railcar
    @train.unhook_railcar
  end

  protected

  def station_list
    @station_list = {}
    @stations.each.with_index(1) { |station, index| @station_list[index] = station }

    puts "Список доступных станций:"
    @station_list.each { |index, station| puts "#{index}. #{station.name}" }
  end

  def route_list
    @route_stations = {}
    @route.stations.each.with_index(1) { |station, index| @route_stations[index] = station }

    puts "Список станций в маршруте:"
    @route_stations.each { |index, station| puts "#{index}. #{station.name}" }
  end

end