class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def new
    @power = Power.new
    @heroines = Heroine.all
  end

  def show
    @power = Power.find(params[:id])
  end
end
