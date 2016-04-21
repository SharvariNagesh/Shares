class Share < ActiveRecord::Base
   attr_accessor :url 

   validates :name, :sector, :current_price, presence: true
   has_many :reviews, dependent: :destroy
end
