require 'rails_helper'

RSpec.feature "Boards", type: :feature do


  context 'board Actions' do 
    let!(:user) { create(:user) }
    let!(:board) { create(:board) }

    before do
      login_as user
      # click_button "下一步"
      # click_button "下一步"
      # click_button "下一步"
      # click_button "下一步"
      # click_button "下一步"
      # click_button "開始使用吧~"
      visit board_path(board)
    end

    scenario 'Create board data' do
      click_on new_board_path
      expect(page).to have_field('請輸入專案名稱')
    end

    scenario 'Read board data' do
      click_on "下一步"
      click_on "下一步"
      click_on "下一步"
      click_on "下一步"
      click_on "下一步"
      click_on "開始使用吧~"
      visit boards_path
      expect(page).to have_content(board.name)
    end

    scenario 'valid Read data' do
      visit board_path(1200)
      expect(page).to have_content("404")
    end

    scenario 'Update board data' do
      visit boards_path
      click_on '編輯', match: :first
      fill_in board.name, with: 'Robert'
      click_on '更新'
      expect(page).to have_content('Robert')
    end

    scenario 'Delete board data' do
      visit boards_path
      click_link '刪除', match: :first
      page.driver.browser.switch_to.alert.accept
      visit boards_path
      # expect(page).not_to have_content('Title')
    end
  end
end
