class SharesController < ApplicationController

  def index
  	@shares = Share.all

  end

  def show
  	@share = Share.find(params[:id])
  end
end
