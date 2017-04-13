require_relative 'railcar'

class PassengerRailcar < RailCar
  attr_reader :free_seats, :reserved_seats

  def initialize(seats)
    @free_seats = seats
    @reserved_seats = 0
    raise "Amount of seats can't be 0 or negative" if seats == 0 || seats < 0
    super
  end

  def take_seat
    if @free_seats > 0
      @free_seats -= 1
      @reserved_seats += 1
    else
      puts "No vacant seats!"
    end
  end
end