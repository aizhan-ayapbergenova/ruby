module Validator

  ATTR_NAME = /^([a-z0-9]\s?-?)*$/i
  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  def name_valid?
    name_validate!
  rescue
    false
  end

  def number_valid?
    number_validate!
  rescue
    false
  end

  protected

  def name_validate!
    raise 'Enter the name of the station' if name.length.zero?
    raise 'The name is incorrect' if name !~ ATTR_NAME
    true
  end

  def number_validate!
    raise "The train number must have letters or numbers and look like this: XXX-XX or XXXXX" if number !~ NUMBER_FORMAT
    puts "The train №#{number} successfully created"
  end
end