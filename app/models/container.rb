class Container < ApplicationRecord
  # relationships
  belongs_to :board
  has_many :cards

  #套件給的
   acts_as_paranoid
   
end
