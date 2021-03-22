class SpacesController < ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:create, :new]
  before_action :is_host?, only: [:edit, :update, :destroy]
  before_action :search_params, only: [:index]

  def index
    @spaces = Space.where(nil)
    @spaces = @spaces.filter_by_city(params[:city]) if params[:city].present?
    @spaces = @spaces.filter_by_category(params[:category]) if params[:category].present?

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def show
    @booking = Booking.new
    
    @space = Space.find(params[:id])
    @comment = @space.comments.build
  end

  def new
    @space = Space.new
  end

  def edit
  end

  def create
    @space = Space.new(space_params)
      if @space.save
        JoinSpaceCategory.create(space_id: @space.id, category_id: params["category"])
        redirect_to @space, notice: "Votre espace a bien été créé. " 
      else
        render :new, status: :unprocessable_entity 
      end
  end

  def update
      if @space.update(space_params)
        redirect_to @space, notice: "Votre espace a bien été mis à jour. " 
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  def destroy
    @space.destroy
    redirect_to spaces_url, notice: "Votre espace a bien été supprimé. " 
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:description, :zip_code, :address, :city, :title, :space_id, :price, images: []).merge(host_id: current_user.id)
  end

  def search_params
    params.permit(:city, :category)
  end

  def is_host?
    @space = set_space
    unless @space.host_id == current_user.id
      flash[:error] = "Vous n'êtes pas autorisé à modifier cet espace."
      redirect_to root_path
    end
  end
end
