class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)

    if @food_item.save
      redirect_to food_items_path, notice: 'New item created'
    else
      render :new
    end
  end

  def show
    @food_item = FoodItem.find(params[:id])
  end

  def update
    @food_item = FoodItem.find(params[:id])
    if @food_item.update(food_item_params)
      redirect_to food_items_path
    else
      render :new
    end
  end

  private
  def food_item_params
    params.require(:food_item).permit(:title, :description, :inventory)
  end
end
