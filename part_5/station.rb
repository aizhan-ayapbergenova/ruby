class Station
  @@stations = []
  attr_reader :trains, :name

  def self.stations
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def station_trains(type)
    @trains.select { |train| train.class.to_s == type }
  end
end