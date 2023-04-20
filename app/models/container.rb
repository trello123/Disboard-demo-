class Container < ApplicationRecord
  # relationships
  belongs_to :board
  has_many :cards
end
