class AddCardIdInMessage < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :messages, :card
  end
end
