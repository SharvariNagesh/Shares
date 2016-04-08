class Review < ActiveRecord::Base
  
  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  PRIORITY = [1, 2, 3]

  validates :priority, inclusion: {
 	in: PRIORITY,
  	message: "must be between 1 and 3"
   }

  belongs_to :share
end
