class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def search
    search_term = search_params[:q]
    @heroines = Heroine.select {|heroine| heroine.power.name == search_term}
    render :index
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
    @power_name = @power.name
    @super_name = @heroine.super_name
    @name = @heroine.name
  end

  def new
    @heroine = Heroine.new
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


  private 

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def search_params
    params.permit(:q)
  end
end
