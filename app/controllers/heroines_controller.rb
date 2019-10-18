class HeroinesController < ApplicationController
  
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def create
    @heroine = Heroine.new(heroine_params)

    if @heroine.save
      flash[:notice] = "You have created a new heroine"
      redirect_to heroine_path(@heroine)
    else
      flash[:notice] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name)
  end 
end
