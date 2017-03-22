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
    puts "Название станции?"
    @stations << Station.new(gets.chomp)
  end

  def create_train
    puts "1. Пассажирский поезд"
    puts "2. Грузовой поезд"
    train_type = gets.to_i

    puts "Номер поезда?"
    train_number = gets.chomp
    
    @train = PassengerTrain.new(train_number) if train_type == 1
    @train = CargoTrain.new(train_number) if train_type == 2
  end

  def create_route
    station_list
    puts "Введите номер начальной станции"
    first_station = @station_list[gets.to_i]
    puts "Введите номер конечной станции"
    last_station  = @station_list[gets.to_i]

    @route = Route.new(first_station, last_station)
  end

  def add_station_route
    unless @route.nil?
      station_list
      puts "Номер станции?"
      number = gets.to_i
      @route.add_station(@station_list[number])
    else
      "Сначала нужно создать маршрут"
    end
  end

  def station_list
    @station_list = {}
    @stations.each.with_index(1) { |station, index| @station_list[index] = station }

    puts "Список доступных станций:"
    @station_list.each { |index, station| puts "#{index}. #{station.name}" }
  end

end