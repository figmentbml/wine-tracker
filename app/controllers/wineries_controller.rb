class WineriesController < ApplicationController
  before_action :set_winery, only: [:show, :edit, :update, :destroy]

  def index
    @wineries = Winery.all
  end

  def new
    @winery = Winery.new
  end

  def create
    @winery = Winery.new(winery_params)
    @winery.save
    redirect_to wineries_path
  end

  def show
  end

  def edit
  end

  def update
    @winery.update(winery_params)
    redirect_to wineries_path
  end

  def destroy
    @winery.destroy
    redirect_to wineries_path
  end

private

  def winery_params
    params.required(:winery).permit(
    :name,
    :street,
    :city,
    :zip,
    :county,
    :hours,
    :phone_number,
    :email,
    :rating,
    :description,
    )
  end

  def set_winery
    @winery = Winery.find(params[:id])
  end

end
