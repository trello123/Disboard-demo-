class AddContainerIdToCard < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :cards, :container
  end
end
