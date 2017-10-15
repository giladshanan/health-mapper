class ProvidersController < ApplicationController
  def search
  end

  def find
    @origin = "USA, Chicago, #{params[:address]}"
    @destination = Provider.near(@origin)[0].full_address
    @provider = Provider.near("USA, Chicago, #{params[:address]}")[0]
  end

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

  def show
    @provider = Provider.find(params[:id])
  end

  private

  def place_params
    params.require(:provider).permit(:name, :address)
  end
end
