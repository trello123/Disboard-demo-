class AddBoardIdToCards < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :cards, :board
  end
end
