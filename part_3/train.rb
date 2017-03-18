class Train

  attr_reader :speed, :type, :carriage_quantity

  def initialize(number, type, carriage_quantity)
    @number = number
    @type   = type
    @carriage_quantity = carriage_quantity
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
    @carriage_quantity += 1 if @speed == 0
  end

  def unhook_vagon
    @carriage_quantity -= 1 if @speed == 0 && @carriage_quantity > 0
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
    @route.stations[@station_index + 1] if @station_index < @route.stations.size - 1
  end
end