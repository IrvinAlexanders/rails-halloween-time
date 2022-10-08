class CostumesController < ApplicationController
  before_action :set_costume, only: [:show, :update, :destroy]
  # visitors can see index page, otherwise will ask for login


  def index
    if params[:query].blank?
      @costumes = Costume.where(category: params[:category])
    else
      @costumes = Costume.search_by_name_and_category(params[:query])
      @query = params[:query]
    end
    # @markers = User.all.geocoded.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
    #     image_url: helpers.asset_url('ghost.png')
    #   }
    # end
  end

  def show
    @query = params[:query]
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @costume = Costume.new
    @categories = ["heroes", "movies", "horror", "animals", "anime", "TV show", "cartoon", "princess", "historical figure"]
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :new
    end
  end

  def destroy
    @costume.destroy
    redirect_to costumes_path
  end
private

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:name, :user, :category, :description, :price, :photo, photos: [])
  end
end
