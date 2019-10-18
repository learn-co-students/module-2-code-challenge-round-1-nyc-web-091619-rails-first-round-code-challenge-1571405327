class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new 
    @heroine = Heroine.new 
  end 

  def show 
    @heroine = Heroine.find(params[:id])
  end 

  def create 
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else 
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end 
  end 

  def edit 
    @heroine = Heroine.find(params[:id])
  end 

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.updated(heroine_params)
    redirect_to heroine_path(@heroine)
  end 

  def destroy
    @heroine = Heroine.find(params[:id])
    @heroine.destroy
    redirect_to new_heroine_path
  end 

  private

  def heroine_params 
    params.require(:heroine).permit(:name, :super_name)
  end 

end #end of heroine_controller.rb 
