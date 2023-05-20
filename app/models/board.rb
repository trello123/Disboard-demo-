# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class Board < ApplicationRecord
  # relationships
  has_many :board_users, dependent: :destroy
  has_many :users, through: :board_users, dependent: :destroy
  has_many :containers, -> { order(:position) }, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one_attached :avatar


  #套件給的
  acts_as_paranoid

end
