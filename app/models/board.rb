class Board < ApplicationRecord
  # relationships
  has_many :board_users
  has_many :users, through: :board_users
  has_many :containers
end
