class AddAssignedToToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :assigned_to, :string, default: '尚未指派'
  end
end
