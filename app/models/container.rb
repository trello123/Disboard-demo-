# == Schema Information
#
# Table name: containers
#
#  id         :bigint           not null, primary key
#  title      :string
#  board_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  position   :integer
#
class Container < ApplicationRecord
  # relationships
  belongs_to :board
  has_many :cards, -> { order(:position) }, dependent: :destroy

  #套件給的
  acts_as_list
  acts_as_paranoid
end
