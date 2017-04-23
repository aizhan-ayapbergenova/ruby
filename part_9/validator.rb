# module Validator

#   ATTR_NAME = /^([a-z\d]\s?-?)*$/i
#   NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i

#   def station_valid?
#     station_validate!
#   rescue
#     false
#   end

#   def train_valid?
#     train_validate!
#   rescue
#     false
#   end

#   protected

#   def station_validate!
#     raise 'Enter the name of the station' if name.length.zero?
#     raise 'The name is incorrect' if name !~ ATTR_NAME
#     true
#   end

#   def train_validate!
#     raise "The train number must have letters or numbers and look like this: XXX-XX or XXXXX" if number !~ NUMBER_FORMAT
#     puts "The train №#{number} successfully created"
#   end
# end