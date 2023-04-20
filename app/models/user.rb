class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relationships
  has_many :board_users
  has_many :boards, through: :board_users
end
