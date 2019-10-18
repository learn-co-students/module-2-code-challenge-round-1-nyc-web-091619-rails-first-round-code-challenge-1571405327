class PowersController < ApplicationController
  
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    @heroines = Heroine.all
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new()
    @power.save
    redirect_to power_path(@power)
  end

  def edit
    @power = find_power_id
  end

  def update
    @power = find_power_id
    @power.update(power_params)
    redirect_to power_path(@power)
  end
 
  private
  
  def power_params
    params.require(:power).permit(:name, :description)
  end
end
