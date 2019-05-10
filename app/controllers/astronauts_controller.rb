class AstronautsController < ApplicationController
  def index
    # binding.pry
    @astronauts = Astronaut.all
  end
end
