class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :card, optional: true
end
