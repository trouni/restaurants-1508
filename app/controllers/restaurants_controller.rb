class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # this is for the form
    @restaurant = Restaurant.new
  end

  def create
    # THIS DOESNT HAVE A VIEW, just for creating an instance
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # This would empty our form:
      # redirect_to new_restaurant_path
      # We want to build a form with the instance they just TRIED to create
      # Show the 'new.html.erb' with the instance above
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # this is for the from
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # whitelisting all the attributes the user can give us in the form
    params.require(:restaurant).permit(:name, :address,:rating, :category)
  end
end
