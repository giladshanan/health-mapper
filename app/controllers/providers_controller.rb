class ProvidersController < ApplicationController
  def index
    @providers = Provider.order('created_at DESC')
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(place_params)
    if @provider.save
      flash[:success] = "Provider added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def place_params
    params.require(:provider).permit(:name, :address)
  end
end
