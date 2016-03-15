class SharesController < ApplicationController

  def index
  	@shares = Share.all

  end

  def show
  	@share = Share.find(params[:id])
  end

  def destroy
  	@share = Share.find(params[:id])
  	@share.destroy
  	redirect_to shares_url
  end
end
