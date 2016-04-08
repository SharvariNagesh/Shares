class Share < ActiveRecord::Base
   attr_accessor :url 

   has_many :reviews, dependent: :destroy
end
