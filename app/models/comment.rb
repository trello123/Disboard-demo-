class Comment < ApplicationRecord
  # relationships
  belongs_to :user
  belongs_to :card

  #套件給的
  acts_as_paranoid

  # 文字編輯器
  has_rich_text :intro
  has_one_attached :avatar
end
