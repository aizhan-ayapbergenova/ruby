class Train

  attr_reader :speed, :type, :number, :carriage_quantity

  def initialize(number, type, carriage_quantity)
    @number = number
    @type   = type
    @carriage_quantity = carriage_quantity
    @speed = 0
    @station = nil
    @route = nil
  end

  def increase_speed
    @speed += 10
  end

  def reset_speed
    @speed = 0
  end

  def route=(route)
    @route = route
    @station = @route.stations.first
  end

  def attach_vagon
    if @speed == 0
      @carriage_quantity += 1
    else
      puts "Error"
    end
  end

  def unhook_vagon
    if @speed == 0 && @carriage_quantity > 0
      @carriage_quantity -= 1
    else
      puts "Error"
    end
  end

  def forward
    if next_station
      current_station.send_train(self)
      next_station.take_the_train(self)
    end
  end

  def backward
    if previous_station
      current_station.send_train(self)
      previous_station.take_the_train(self)
    end
  end

  def current_station
    @station
  end

  def previous_station
    previous_index = @route.stations.index(@station) - 1
    if previous_index > 0
      @route.stations[previous_index]
    end
  end

  def next_station
    next_index = @route.stations.index(@station) + 1
    @route.stations[next_index]
  end
end