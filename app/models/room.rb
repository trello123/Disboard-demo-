# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#
class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :board
end
