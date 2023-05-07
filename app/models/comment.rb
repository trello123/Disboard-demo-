class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  #套件給的
  acts_as_paranoid
end
