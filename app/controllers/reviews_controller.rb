class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    #@reviews = Review.all
    render json: @reviews.to_json(include: :coffee)
    
  end

  # GET /reviews/1
  def show
    p @review
    render json: @review
  end

  # POST /reviews
  def create
    p 'Im here'
    @review = Review.new(review_params)
@review.coffee_id = params[:coffee_id]
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  # def update
  #   if @review.update(review_params)
  #     render json: @review
  #   else
  #     render json: @review.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:title, :content, :author)
    end
end
