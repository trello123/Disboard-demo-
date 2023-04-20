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
  validates :intro, presence: true

  # relationships
  belongs_to :container

  #套件給的
  acts_as_list

  enum level: { '待確認': 0, '簡單': 1, '普通': 2, '困難': 3 }

  def self.level_list
    levels.map { |k, _v| [k, k] }
  end
end
