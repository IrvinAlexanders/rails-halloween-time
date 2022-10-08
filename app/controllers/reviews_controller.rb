class ReviewsController < ApplicationController
  before_action :find_costume, except: [:destroy]

  def new

  end

  def create
    @review = Review.new(review_params)
    @review.costume = @costume
    authorize @review

    if @review.save
      redirect_to costume_path(@costume)
    else
      render :new
    end
  end
  private

  def find_costume
    @costume = Costume.find(params[:costume_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
