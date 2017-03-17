class Train

  attr_reader   :type, :number, :carriage_quantity
  attr_accessor :speed

  def initialize(number, type, carriage_quantity)
    @number = number
    @type   = type
    @carriage_quantity = carriage_quantity
    @speed = 0
    @station_index = 0
  end

  def increase_speed(speed)
    @speed += speed
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

  def take_the_route(route)
    @route = route.stations
  end

  def move_to(direction)
    @current_station = @route[@station_index]
    if direction == "next".downcase && @station_index < @route.size - 1
      @current_station = @route[@station_index + 1]
      puts @current_station
      @station_index += 1
    elsif direction == "previous".downcase && @station_index > 0
      @current_station = @route[@station_index - 1]
      puts @current_station
      @station_index -= 1
    else
      puts "Error"
    end
  end

  def show_station
    @current_station = @route[@station_index]
    @next_station = @route[@station_index + 1]
    @previous_station = @route[@station_index - 1]
    if @station_index == 0
      puts "The train is on the first - #{@current_station} station, next station is - #{@next_station}"
    elsif @station_index == @route.size - 1
      puts "The train is on the last - #{@current_station} station, previous station is - #{@previous_station}"
    else
      puts "The train is on the #{@current_station} station, next station is - #{@next_station}, previous station is - #{@previous_station}"
    end
  end
end