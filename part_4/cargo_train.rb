class CargoTrain < Train

  def attach_railcar(railcar)
    @railcar_type = "CargoRailcar"
    super
  end

end