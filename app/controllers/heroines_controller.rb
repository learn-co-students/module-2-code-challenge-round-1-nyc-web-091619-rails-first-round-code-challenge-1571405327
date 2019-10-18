class HeroinesController < ApplicationController


  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroines_path
    else
      redirect_to new_heroine_path, :flash => { :error => "Can't have the same name Heroine! Be original" }
      #render :new, :flash => { :error => "Can't have the same name Heroine! Be original" }
    end

  end



  
  private #private methods

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
