class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :intro
      t.integer :level, default: 0
      #  0: -, 1: 簡單, 2: 普通, 3: 困難


      t.timestamps
    end
  end
end
