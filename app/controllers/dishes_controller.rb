class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)
    @dish.restaurant_id = @restaurant.id

    if @dish.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    if @dish.update(dish_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :price, :description, :quantity, :rating)
    end
end
