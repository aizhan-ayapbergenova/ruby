class Route

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if station != @stations[0] && station != @stations[1]
      @stations.delete(station)
    else
      puts "Error"
    end
  end

  def show_all_stations
    @stations.each { |station| print station, ", " }
  end
end