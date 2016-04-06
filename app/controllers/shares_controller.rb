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

  def new
    @share = Share.new
  end

  def create
     @url = params[:share][:url]
    @shareNew = Share.new(share_params)
    @share_details = readShareBasic(@url)
    @shareNew.name = @share_details[:name]
    @shareNew.current_price = @share_details[:current_price]
  #  @shareNew.sector=@share_details[:sector]
    @shareNew.description=@share_details[:description]
    @shareNew.year_low=@share_details[:year_low]
    @shareNew.year_high=@share_details[:year_high]
    @shareNew.market_cap=@share_details[:market_cap]
    @shareNew.current_PE_ratio=@share_details[:current_PE_ratio]
    @shareNew.book_value =@share_details[:book_value]
    @shareNew.price_to_book_value=@share_details[:price_to_book_value]
    @shareNew.save
    redirect_to shares_url
  end

private
  def share_params
    params.require(:share).permit( :name, :current_price, :year_low, :year_high, :current_PE_ratio, :market_cap, :book_value, :description, :price_to_book_value)
  end 
end
