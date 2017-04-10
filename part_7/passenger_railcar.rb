require_relative 'railcar'

class PassengerRailcar < RailCar
  attr_reader :free_seats, :taken_seats

  def initialize(seats)
    @free_seats = seats
    @taken_seats = 0
  end

  def take_seat
    @free_seats -= 1
    @taken_seats += 1
  end
end