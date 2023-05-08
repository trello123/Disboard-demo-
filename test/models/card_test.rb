# == Schema Information
#
# Table name: cards
#
#  id           :bigint           not null, primary key
#  title        :string
#  intro        :text
#  level        :integer          default("待確認")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  position     :integer
#  container_id :bigint
#  daybegin     :datetime
#  deadline     :datetime
#  deleted_at   :datetime
#  avatar       :string
#  board_id     :bigint
#  assigned_to  :string           default("尚未指派")
#
require "test_helper"

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
