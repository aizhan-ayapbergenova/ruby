class Station
  attr_reader :trains, :name

  @stations = []

  def self.all
    @stations
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
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