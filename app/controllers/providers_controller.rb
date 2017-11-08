class ProvidersController < ApplicationController
  before_action :authorize

  def search
  end

  def find
    @origin = "USA, Chicago, #{params[:address]}"
    @provider = Provider.near(@origin)[0]
    if @provider
      @destination = @provider.full_address
    else
      flash[:error] = "Hm, we couldn't find that address.  Sorry, please try again."
      redirect_to root_path
    end
    @ip_address = Provider.new(address: params[:address])
    @lat = @ip_address.latitude
    @long = @ip_address.longitude
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
