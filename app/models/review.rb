class Review < ActiveRecord::Base
  
  #validation code to make sure name, comment and valid priority is present in the user data.

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  PRIORITY = [1, 2, 3]

  validates :priority, inclusion: {
 	in: PRIORITY,
  	message: "must be between 1 and 3"
   }

   #Review belongs to share and have 1 to many relation
   belongs_to :share
end
