class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
    end
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    raise "The route must contain only stations" if @stations[0].class.to_s != "Station" || @stations[1].class.to_s != "Station"
  end
end