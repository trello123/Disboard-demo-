require 'rails_helper'

RSpec.feature "Boards", type: :feature, js: true do
  context 'Board Actions' do 
    let!(:user) { create(:user) }

    before do
      login_as user
      visit boards_path
      6.times {
        find('.introjs-nextbutton').click
      }
      find('.fa-plus').click
      fill_in '請輸入專案名稱', with: 'ABC'
      click_on '建立'
      visit boards_path
    end

    scenario 'Create board data' do
      find('.fa-plus').click
      expect(page).to have_field('請輸入專案名稱')
      fill_in '請輸入專案名稱', with: 'Robert'
      click_on '建立'
      expect(page).to have_content('Robert')
    end

    scenario 'Read board data' do
      visit boards_path
      expect(page).to have_content("專案列表")
    end

    scenario 'Valid Read data' do
      visit board_path(1200)
      expect(page).to have_content("404")
    end

    scenario 'Update board data' do
      visit boards_path
      click_on '編輯', match: :first
      fill_in '請輸入專案名稱', with: 'Rob'
      click_on '更新'
      expect(page).to have_content('Rob')
    end

    scenario 'Delete board data' do
      visit boards_path
      click_link '刪除', match: :first
      click_button '確定'
      visit boards_path
      expect(page).not_to have_content('ABC')
    end

    scenario 'Cancel delete board data' do
      visit boards_path
      click_link '刪除', match: :first
      click_button '取消'
      visit boards_path
      expect(page).to have_content('ABC')
    end
  end
end
