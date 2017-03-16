class Station
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
    passenger_trains = []
    @trains.each { |train| passenger_trains << train if train.type == "passenger" }
    p passenger_trains
  end

  def show_freight_trains
    freight_trains = []
    @trains.each { |train| freight_trains << train if train.type == "freight" }
    p freight_trains
  end

  def send_train(number_of_train)
    @trains.delete_if { |train| train.number == number_of_train }
  end
end