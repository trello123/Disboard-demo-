class CreateContainers < ActiveRecord::Migration[6.1]
  def change
    create_table :containers do |t|
      t.string :title
      t.belongs_to :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
