class BoardUser < ApplicationRecord
  # relationships
  belongs_to :board
  belongs_to :user
end
