class AddAvatarToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :avatar, :string
  end
end
