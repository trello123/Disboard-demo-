class Comment < ApplicationRecord
  # relationships
  belongs_to :user
  belongs_to :card

  #軟刪除功能套件給的
  acts_as_paranoid


end
