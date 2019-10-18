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

   def create
    
    @power = Power.create(power_params)
     if @power.save
    redirect_to power_path(@power)
    
        
    else
        redirect_to new_power_path
    end
   end

   def edit
    @power = Power.find(params[:id])
   end

   def update
    @power = Power.find(params[:id])
    @power.update(power_params)
   end

   def destroy
    @power = Power.find(params[:id])
    @power.destroy
    redirect_to new_power_path
   end

   private
   def power_params
    params.require(:power).permit(:name, :description)
   end

end




