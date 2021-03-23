class StaticsController < ApplicationController
  def landing_page
    @spaces = Space.first(3)
  end

  def team
  end
end
