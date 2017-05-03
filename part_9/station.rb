require_relative 'accessors'
require_relative 'train'
require_relative 'validation'

class Station
  include Validation

  @stations = []

  def self.all
    @stations
  end

  ATTR_NAME = /^([a-z\d]\s?-?)*$/i

  attr_reader :trains, :name
  
  validate :name, :presence
  validate :name, :format, ATTR_NAME
  validate :name, :type, String

  def initialize(name)
    @name = name
    @trains = []
    validate!
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

  def pass_train(&block)
    @trains.each_with_index do |train, index|
      block.call(train, index)
    end
  end
end
