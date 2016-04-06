class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  protected

  def readShareBasic(shareLink)

    require 'open-uri'
	parameterHash = Hash[]

   page = Nokogiri::HTML(open(shareLink))
   current_price = page.css("div#Bse_Prc_tick_div").text  #.css("span#Bse_Prc_tick strong")
   if current_price.empty? 
   	return "Not a traded share"
   end
   parameterHash[:name]=page.css("div#nChrtPrc div[class='b_42 PT5'] h1.b_42").text
   parameterHash[:current_price] = current_price
   parameterHash[:sector] = page.css("div#nChrtPrc div[class='FL gry10'] a.gry10").text
   parameterHash[:description] = page.css("div.pc_abtinfo p")
   
   parameterHash[:year_low] = page.css("span#b_52low.PR5").text
   parameterHash[:year_high] = page.css("span#b_52high.PL5").text
   
   basicParameters = page.css("div#mktdet_1").css("div[class='PA7 brdb']")
   
   parameterHash[:market_cap] = basicParameters[0].css("div[class='FR gD_12']").text
   parameterHash[:current_PE_ratio] = basicParameters[1].css("div[class='FR gD_12']").text
   parameterHash[:book_value] = basicParameters[2].css("div[class='FR gD_12']").text
   parameterHash[:price_to_book_value] = basicParameters[8].css("div[class='FR gD_12']").text
   
   return parameterHash
   end
end
