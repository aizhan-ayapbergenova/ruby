class Station

  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_the_train(train)
    @trains << train
  end
  
  def passenger_trains
    @trains.select { |train| train.type == "passenger" }
  end

  def freight_trains
    @trains.select { |train| train.type == "freight" }
  end

  def send_train(number_of_train)
    @trains.delete_if { |train| train.number == number_of_train }
  end
end