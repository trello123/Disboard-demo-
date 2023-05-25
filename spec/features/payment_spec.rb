require 'rails_helper'

RSpec.feature "Payments", type: :feature, js: true do
  context 'Board Actions' do 
    let!(:user) { create(:user) }

    before do
      login_as user
      visit boards_path
      6.times {
        find('.introjs-nextbutton').click
      }
      find('.fa-plus').click
    end

    scenario 'Upgrade user status' do
      visit payments_path
      expect(page).to have_content('尊榮會員')
      click_on '立刻升級'
      expect(page).to have_content('藍新金流')
    end
  end
end
