class Route
  attr_reader :stations, :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station  = last_station
    validate!
    @stations = [first_station, last_station]
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
    raise "The route must contain only stations" if first_station.class.to_s != "Station" || last_station.class.to_s != "Station"
  end
end