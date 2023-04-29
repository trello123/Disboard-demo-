class AddBoardIdInRoom < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :rooms, :board
  end
end
