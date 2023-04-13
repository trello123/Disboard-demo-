# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  title      :string
#  intro      :text
#  level      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
