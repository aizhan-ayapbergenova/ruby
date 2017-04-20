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
    return unless station == @stations.first || station == @stations.last
    @stations.delete(station)
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    first, last = @stations
    if first.class.to_s != "Station" || last.class.to_s != "Station"
      raise "The route must contain only stations"
    end
  end
end
