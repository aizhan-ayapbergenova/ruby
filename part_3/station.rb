class Station

  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_the_train(train)
    @trains << train
  end

  def show_all_trains
    @trains
  end

  def show_passenger_trains
    passenger_trains = [] << @trains.select { |train| train.type == "passenger" }
  end

  def show_freight_trains
    freight_trains = [] << @trains.select { |train| train.type == "freight" }
  end

  def send_train(number_of_train)
    @trains.delete_if { |train| train.number == number_of_train }
  end
end