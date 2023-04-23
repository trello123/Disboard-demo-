class AddDaybeginAndDeadlineToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :daybegin, :datetime
    add_column :cards, :deadline, :datetime
  end
end
