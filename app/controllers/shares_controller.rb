class SharesController < ApplicationController

  #index takes care of listing share information. will_paginate gem's paginate routine is used to display 10 share details per page
  def index
  	@shares = Share.paginate(:page=>params[:page], :per_page=>10)
  end

  #sector information is stored along with share information. This routine takes care of displaying share information based on sector.
  #A route is added config/routes.rb to include this controller routine. "Sector" information is passed to this routine as a parameter from the view.
  #will_paginate is used to display 10 share details perpage.
  def sector
    @sector = params[:sector]
    @shares = Share.where(sector: params[:sector]).paginate(:page=>params[:page], :per_page=>10)
  end

  #about routine takes care of displaying "About" page. 
  def about
  end
  
  #controller to display contact information. 
  def contact
  end

  #"show" controller method takes care of displaying each share detail
  def show
  	@share = Share.find(params[:id])
    @reviews = @share.reviews.order(priority: :asc).limit(3)
    @reviewToAlter = @share.reviews.new
  end

  #destroy method takes care of deleting the share record
  def destroy
  	@share = Share.find(params[:id])
  	@share.destroy
  	redirect_to shares_url, alert: "Share successfully deleted!"
  end

  #new method aids creating a new Share record. The @share variable created here will be used by new.html.erb file to pring the form
  def new
    @share = Share.new
  end

  #create method is called when a new share is being extracted from moneycontrol website. 
  #create method takes care of sanitizing the url entered by user for share data extraction.
  #it calls a method "readShareBasic" declared in the application_controller.rb file to extract the share details.
  #If the Share is already present in the database(by comparing the name), the same record is picked up or else a new share record will be created.
  #This routine so acts both as update(for editing) and create routine for the share controller.
  #If the share data is extracted successfully, then the values are assigned to @share variable and saved.
  #Any error either in data extraction code or in model will be communicated to user by setting flash[:error]
  #
  def create

    #sanitize_website is called to sanitize the URL entered by the user.
    @url = sanitize_website(params[:share][:url])
    if(@url.nil?)
      flash[:error] ="Error:Invalid URL. Please enter a valid Moneycontrol.com url"
      @share=Share.new
      render :new
      return 
    end
    @share_details = readShareBasic(@url)
  
    #readShareBasic routine will set :error key to communicate any error while extracting the share information 
    if(@share_details[:error].present?)
      flash[:error] = "Error:Invalid URL. \n " + @share_details[:error]
      @share=Share.new
      render :new
      return 
    end
  
    #If the share price is blank, it concludes that it is not a traded share and such shares will not be put into the database.
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

  #sanitize_website makes sure the url is from Moneycontrol website and takes care of appending "http://" to the url
  #if "http://" or "https://" is not present in the url, open function of open-uri will through exception. To avoid that, http:// is appended by sanitize_website routine
  def sanitize_website(website)
    unless website.include?("http://") || website.include?("https://")
      website = "http://" + website
    end
    if website !~ /Moneycontrol\.com/i
      return nil
    end
    
    return website
  end

#list of permitted parameters for creating the share.
  def share_params
    params.require(:share).permit( :name, :current_price, :year_low, :year_high, :current_PE_ratio, :market_cap, :book_value, :description, :price_to_book_value)
  end 
end
