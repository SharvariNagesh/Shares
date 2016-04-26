class SharesController < ApplicationController

  def index
  	@shares = Share.paginate(:page=>params[:page], :per_page=>5)

  end

  def sector
    @sector = params[:sector]
    @shares = Share.where(sector: params[:sector]).paginate(:page=>params[:page], :per_page=>5)
  end

  def about
  end
  
  def contact
  end

  def show
  	@share = Share.find(params[:id])
    @reviews = @share.reviews.order(priority: :asc).limit(3)
    @reviewToAlter = @share.reviews.new
  end

  def destroy
  	@share = Share.find(params[:id])
  	@share.destroy
  	redirect_to shares_url, alert: "Share successfully deleted!"
  end

  def new
    @share = Share.new
  end

  def create
    @url = sanitize_website(params[:share][:url])
    if(@url.nil?)
      flash[:error] ="Error:Invalid URL. Please enter a valid Moneycontrol.com url"
      @share=Share.new
      render :new
      return 
    end
    @share_details = readShareBasic(@url)
    if(@share_details[:error].present?)
      flash[:error] = "Error:Invalid URL. \n " + @share_details[:error]
      @share=Share.new
      render :new
      return 
    end
    if @share_details[:current_price].blank? 
      # "Not a traded share"
      flash[:alert] ="Error: Not a traded share"
      @share=Share.new
      render :new
      return
    end
    
      @share = Share.where(:name => @share_details[:name]).first_or_initialize(share_params)
      @share.name = (@share_details[:name])
      @share.current_price = @share_details[:current_price]
      @share.sector=(@share_details[:sector]).to_s
      @share.description=@share_details[:description]
      @share.year_low=@share_details[:year_low]
      @share.year_high=@share_details[:year_high]
      @share.market_cap=@share_details[:market_cap]
      @share.current_PE_ratio=@share_details[:current_PE_ratio]
      @share.book_value =@share_details[:book_value]
      @share.price_to_book_value=@share_details[:price_to_book_value]
    
    if @share.save
        redirect_to shares_path(@movie), notice: 'Share data created/updated successfully!'
    else
      flash[:error] = "Error: #{@share.errors.full_messages.to_sentence}"
      render :edit
    end
   end

private

  def sanitize_website(website)
    unless website.include?("http://") || website.include?("https://")
      website = "http://" + website
    end
    if website !~ /Moneycontrol\.com/i
      return nil
    end
    
    return website
  end


  def share_params
    params.require(:share).permit( :name, :current_price, :year_low, :year_high, :current_PE_ratio, :market_cap, :book_value, :description, :price_to_book_value)
  end 
end
