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
    @power_name = @power.name.titlecase
    @super_name = @heroine.super_name.titlecase
    @name = @heroine.name.titlecase
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

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params)

    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to edit_heroine_path(@heroine)
    end

  end

  def destroy
    Heroine.destroy(params[:id])
    redirect_to heroines_path

  end

  private 

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def search_params
    params.permit(:q)
  end
end
