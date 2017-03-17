class Train

  attr_reader   :speed, :type, :number, :carriage_quantity
  attr_accessor :route

  def initialize(number, type, carriage_quantity)
    @number = number
    @type   = type
    @carriage_quantity = carriage_quantity
    @speed = 0
    @station_index = 0
  end

  def increase_speed
    @speed += 10
  end

  def reset_speed
    @speed = 0
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

  def to_next_station
    if @station_index < @route.stations.size - 1
      @current_station = @route.stations[@station_index + 1]
      @station_index += 1
    else
      puts "Error"
    end
  end

  def to_previous_station
    if @station_index > 0
      @current_station = @route.stations[@station_index - 1]
      @station_index -= 1
    else
      puts "Error"
    end
  end

  def previous_station
    if @station_index > 0
      @route.stations[@station_index - 1]
    else
      puts "Error"
    end
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    if @station_index < @route.stations.size - 1
      @route.stations[@station_index + 1]
    else
      puts "Error"
    end
  end
end