class Station

  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains.push(train) 
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains(type)
    @trains.select { |train| train.type == type }
  end
end

class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if station != first_station && station != last_station
      @stations.delete(station)
    end
  end
end

class Train

  attr_reader :speed, :type, :wagon_amount

  def initialize(number, type, carriage_quantity)
    @number = number
    @type   = type
    @wagon_amount = wagon_amount
    @speed = 0
  end

  def increase_speed
    @speed += 10
  end

  def reset_speed
    @speed = 0
  end

  def route=(route)
    @route = route
    @station_index = 0
  end

  def attach_vagon
    @wagon_amount += 1 if @speed == 0
  end

  def unhook_vagon
    @wagon_amount -= 1 if @speed == 0 && @add_wagons > 0
  end

  def forward
    if next_station
      current_station.send_train(self)
      next_station.take_train(self)
      @station_index += 1
    end
  end

  def backward
    if previous_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @station_index -= 1
    end
  end

  def current_station
    @route.stations[@station_index]
  end

  def previous_station
   @route.stations[@station_index - 1] if @station_index > 0
  end

  def next_station
    @route.stations[@station_index + 1]
  end
end
