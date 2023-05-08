# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text
#  user_id    :bigint           not null
#  room_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  card_id    :bigint
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :card, optional: true
end
