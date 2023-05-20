class Comment < ApplicationRecord
  acts_as_paranoid

  # relationships
  belongs_to :user
  belongs_to :card
end
