class AddBoardUsersColumnRole < ActiveRecord::Migration[6.1]
  def change
    # 0: 邀請中, 1: 成員
    add_column :board_users, :role, :integer, default: 0
  end
end
