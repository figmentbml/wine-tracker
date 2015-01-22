class WinesController < ApplicationController
  before_action :ensure_logged_in_user, except: [:index, :show]
  before_action :only_admin, only: [:edit, :update, :destroy]

  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      redirect_to wines_path, notice: 'Wine was successfully added.'
    else
      render :new
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    if @wine.save
      redirect_to wines_path, notice: 'Wine was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path, notice: 'Wine was successfully deleted.'
  end

private

  def wine_params
    params.required(:wine).permit(
    :grape_varietal,
    :country,
    :state,
    :vineyard,
    :year,
    :rating,
    :name,
    :winery_id,
    :tasting_notes_id,
    :wine_pic
    )
  end

end
