class Board < ApplicationRecord
  # relationships
  has_many :board_users, dependent: :destroy
  has_many :users, through: :board_users, dependent: :destroy
  has_many :containers, dependent: :destroy



  #套件給的
  acts_as_paranoid

end
