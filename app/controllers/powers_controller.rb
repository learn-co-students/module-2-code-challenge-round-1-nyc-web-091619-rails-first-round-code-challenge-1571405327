class PowersController < ApplicationController
  
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    @name = @power.name
    @description = @power.description
  end

  private 

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
