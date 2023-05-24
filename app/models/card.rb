# == Schema Information
#
# Table name: cards
#
#  id           :bigint           not null, primary key
#  title        :string
#  intro        :text
#  level        :integer          default("待確認")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  position     :integer
#  container_id :bigint
#  daybegin     :datetime
#  deadline     :datetime
#  deleted_at   :datetime
#  avatar       :string
#  board_id     :bigint
#  assigned_to  :string           default("尚未指派")
#
class Card < ApplicationRecord
  validates :title, presence: true
  validate :daybegin_cannot_greater_than_deadline

  def daybegin_cannot_greater_than_deadline
    if daybegin.present? && deadline.present? && deadline < daybegin
      errors.add(:daybegin, "開始日期不得大於結束日期")
    end
  end

  # 文字編輯器
  has_rich_text :intro
  has_one_attached :avatar

  # relationships
  belongs_to :container , optional: true
  belongs_to :board
  has_one :message
  has_many :comments, dependent: :destroy

  #套件給的
  acts_as_list scope: :container
  acts_as_paranoid


  enum level: { '待確認': 0, '緊急': 1, '重要': 2, '一般': 3 }


  class << self
    def level_list
      levels.map { |k, _v| [k, k] }
    end

    def calendar
      where.not(daybegin: nil)
    end
  end
end
