class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(bike)
    bike.fix
    bikes << bike
  end

  def return_bikes
    bikes.pop
  end

end
