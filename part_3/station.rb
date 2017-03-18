class Station

  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains(type)
    @trains.select { |train| train.type == type }
  end
end