require_relative 'station'
require_relative 'route'
require_relative 'trains'
require_relative 'railcars'


class Application

  attr_reader :station, :route, :train, :stations

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
    h = {}
    @stations.each.with_index(1) do |station, index|
      h[index] = station
    end

    puts "Список доступных станций:"
    h.each { |index, station| puts "#{index}. #{station.name}" }

    puts "Введите номер начальной станции"
    first_station = h[gets.to_i]
    puts "Введите номер конечной станции"
    last_station  = h[gets.to_i]
    
    @route = Route.new(first_station, last_station)
  end

  def add_station

  end

  private

  attr_writer :station, :route, :train

end