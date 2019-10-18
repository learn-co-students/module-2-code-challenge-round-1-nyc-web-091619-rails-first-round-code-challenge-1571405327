class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def chosen_power
    @power = Power.find(params[:id])
    redirect_to power_path(@power)
  end
end
