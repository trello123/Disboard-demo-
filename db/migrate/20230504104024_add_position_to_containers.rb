class AddPositionToContainers < ActiveRecord::Migration[6.1]
  def change
    add_column :containers, :position, :integer
  end
end
