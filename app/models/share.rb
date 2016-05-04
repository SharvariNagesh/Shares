class Share < ActiveRecord::Base
  #Since URL is not part of the share table, to aid getting url from the user, url is added as a class variable.
   attr_accessor :url 

   #validates the presence of name, sector and current_price of the share. Other parameters are optional
   validates :name, :sector, :current_price, presence: true

   #dependent: :destroy will take care of destroying reviews associated with the share when share is deleted
   #There exists a 1 to many relation between share and reviews
   has_many :reviews, dependent: :destroy  
end
