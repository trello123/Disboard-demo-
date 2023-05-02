# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  title      :string
#  intro      :text
#  level      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Card < ApplicationRecord
  validates :title, presence: true

  # 文字編輯器
  has_rich_text :intro

  # relationships
  belongs_to :container , optional: true

  #套件給的
  acts_as_list
  acts_as_paranoid
  mount_uploader :avatar, AvatarUploader

  enum level: { '待確認': 0, '簡單': 1, '普通': 2, '困難': 3 }


  class << self
    def level_list
      levels.map { |k, _v| [k, k] }
    end

    def calendar
      where.not(daybegin: nil)
    end
  end
end
