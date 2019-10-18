class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :find_dish, :find_restaurant
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.dish_id = @dish.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to restaurant_dish_path(@restaurant, @dish)
    else
      render 'new'
    end
    
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      redirect_to restaurant_dish_path(@restaurant, @dish)
    else
      redirect_to 'edit'
    end
    
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_to restaurant_dish_path(@restaurant, @dish)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_dish
      @dish = Dish.find(params[:dish_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:body, :value, :dish_id, :user_id)
    end
end
