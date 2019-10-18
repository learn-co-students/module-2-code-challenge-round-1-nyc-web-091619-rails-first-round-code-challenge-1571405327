class HeroinesController < ApplicationController
  def index
    @heroines = get_heroines 
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
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def get_heroines
    if params[:q]
      powers = Power.find_by(name: params[:q])
      @heroines = Heroine.where(power_id: powers)
    else
      @heroines = Heroine.all 
    end
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
