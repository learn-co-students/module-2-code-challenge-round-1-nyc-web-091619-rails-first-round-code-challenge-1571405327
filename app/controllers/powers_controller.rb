class PowersController < ApplicationController
  
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    @name = @power.name
    @description = @power.description
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)

    if @power.save
      redirect_to power_path(@power)
    else
      flash[:errors] = @power.errors.full_messages
      redirect_to new_power_path
    end
  end

  def edit
    @power = Power.find(params[:id])
  end

  def update
    @power = Power.find(params[:id])
    @power.update(power_params)

    if @power.valid?
      redirect_to power_path(@power)
    else
      flash[:errors] = @power.errors.full_messages
      redirect_to edit_power_path(@power)
    end

  end

  def destroy
    Power.destroy(params[:id])
    redirect_to powers_path
  end

  private 

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
