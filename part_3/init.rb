class Station

  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_the_train(train)
    @trains << train
  end
  
  def show_passenger_trains
    passenger_trains = [] << @trains.select { |train| train.type == "passenger" }
  end

  def show_freight_trains
    freight_trains = [] << @trains.select { |train| train.type == "freight" }
  end

  def send_train(number_of_train)
    @trains.delete_if { |train| train.number == number_of_train }
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
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
    else
      puts "Error"
    end
  end
end

class Train

  attr_reader   :type, :number
  attr_accessor :speed

  def initialize(number, type, vagon_quantity)
    @number = number
    @type   = type
    @vagon_quantity = vagon_quantity
    @speed = 0
    @station = 0
  end

  def increase_speed(speed)
    @speed = speed
  end

  def current_speed
    @speed
  end

  def decrease_speed
    @speed = 0
  end

  def show_vagon_quantity
    @vagon_quantity
  end

  def attach_unhook_vagon(attach_unhook)
    if self.current_speed == 0 && attach_unhook == "attach".downcase
      @vagon_quantity += 1
    elsif self.current_speed == 0 && attach_unhook == "unhook".downcase
      @vagon_quantity -= 1
    else
      puts "Error"
    end
  end

  def take_the_route(route)
    @route = route.stations
  end

  def move_to(direction)
    @current_station = @route[@station]
    if direction == "next".downcase && @station < @route.size - 1
      @current_station = @route[@station + 1]
      puts @current_station
      @station += 1
    elsif direction == "previous".downcase && @station > 0
      @current_station = @route[@station - 1]
      puts @current_station
      @station -= 1
    else
      puts "Error"
    end
  end

  def show_station
    @current_station = @route[@station]
    @next_station = @route[@station + 1]
    @previous_station = @route[@station - 1]
    if @station == 0
      puts "The train is on the first - #{@current_station} station, next station is - #{@next_station}"
    elsif @station == @route.size - 1
      puts "The train is on the last - #{@current_station} station, previous station is - #{@previous_station}"
    else
      puts "The train is on the #{@current_station} station, next station is - #{@next_station}, previous station is - #{@previous_station}"
    end
  end
end