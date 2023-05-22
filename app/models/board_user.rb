# == Schema Information
#
# Table name: board_users
#
#  id         :bigint           not null, primary key
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BoardUser < ApplicationRecord
  # relationships
  belongs_to :board
  belongs_to :user

  enum role: { '邀請中': 0, '成員': 1 }
end
