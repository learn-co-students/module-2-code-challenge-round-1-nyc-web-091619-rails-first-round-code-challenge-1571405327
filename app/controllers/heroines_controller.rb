class HeroinesController < ApplicationController
  def index  
    @heroines = Heroine.search(params[:search])

   end

   def new 
    @heroine = Heroine.new
    @powers = Power.all
   end

   def show
    @heroine = Heroine.find(params[:id])
   end

   def create
    
    @heroine = Heroine.create(heroine_params)
     if @heroine.save
    redirect_to heroine_path(@heroine)
    
        
    else
        redirect_to new_heroine_path
    end
   end

   def edit
    @heroine = Heroine.find(params[:id])
   end

   def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params)
   end

   def destroy
    @heroine = Heroine.find(params[:id])
    @heroine.destroy
    redirect_to new_heroine_path
   end

   private
   def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
   end

end
