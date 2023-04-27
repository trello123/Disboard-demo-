class AddAvatarToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :avatar, :string
  end
end
