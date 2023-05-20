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
  acts_as_paranoid

  # relationships
  has_many :board_users, dependent: :destroy
  has_many :users, through: :board_users, dependent: :destroy
  has_many :containers, -> { order(:position) }, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :cards, dependent: :destroy

  def container_status
    containers.pluck(:title, :id)
  end
end
