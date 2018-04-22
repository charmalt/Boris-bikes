class Bike

  attr_accessor :working

  def initialize(working = true)
    @working = working
  end

  def fix
    working = true 
  end

end
