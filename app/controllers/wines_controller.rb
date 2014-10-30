class WinesController < ApplicationController

  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.save
    redirect_to wines_path
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    @wine.save
    redirect_to wines_path
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
  end

private

  def wine_params
    params.required(:wine).permit(:grape_varietal, :country, :state, :vineyard, :year, :rating)
  end

end
