module Manufacturer
  attr_reader :company

  def manufacturer(company)
    self.company = company
  end

  protected

  attr_writer :company
end