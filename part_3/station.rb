class Station

  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_the_train(train)
    @trains << train
  end

  def trains(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(number_of_train)
    @trains.delete_if { |train| train.number == number_of_train }
  end
end