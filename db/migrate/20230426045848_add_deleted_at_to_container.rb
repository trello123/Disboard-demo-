class AddDeletedAtToContainer < ActiveRecord::Migration[6.1]
  def change
    add_column :containers, :deleted_at, :datetime
    add_index :containers, :deleted_at
  end
end
