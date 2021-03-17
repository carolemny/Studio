class JoinSpaceCategoriesController < ApplicationController
  def index
    @join_space_categories = JoinSpaceCategory.all
  end
end
