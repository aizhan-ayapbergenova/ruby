class Train

  attr_reader :speed, :railcar_list, :type

  def initialize(number)
    @number = number
    @railcar_list = []
    self.type
    self.speed = 0
  end

  def increase_speed
    self.speed += 10
  end

  def reset_speed
    self.speed = 0
  end

  def route=(route)
    @route = route
    @station_index = 0
  end

  def attach_railcar(railcar)
    @railcar_list << railcar if railcar.type == type && stop?
  end

  def unhook_railcar
    @railcar_list.pop
  end

  def forward
    if next_station
      current_station.send_train(self)
      next_station.take_train(self)
      @station_index += 1
    end
  end

  def backward
    if previous_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @station_index -= 1
    end
  end

  def current_station
    @route.stations[@station_index]
  end

  def previous_station
   @route.stations[@station_index - 1] if @station_index > 0
  end

  def next_station
    @route.stations[@station_index + 1]
  end

  def stop? # Метод не делаем приватным/защищенным чтобы можно было узнать остановлен ли поезд
    self.speed.zero?
  end

  protected # Потому что сеттер speed также необходим в подклассах

  attr_writer :speed # Для запрета прямого управления скоростью из клиентского кода

end

class PassengerTrain < Train
  def type
    @type = "passenger"
  end
end

class CargoTrain < Train
  def type
    @type = "cargo"
  end
end