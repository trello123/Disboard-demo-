require 'rails_helper'

RSpec.feature "Boards", type: :feature do
  context 'board Actions' do 
    before(:each) do
      visit '/'
      user = User.create(email: 'aa@aa.aa', encrypted_password: '123456')
      click_on '登入'
      visit boards_path
    end

    scenario 'Create board data' do
      click_on '新增'
      expect(page).to have_content('新專案')
    end

    scenario 'Read board data' do
      click_on '新專案'
      expect(page).to have_content('todo')
    end

    scenario 'valid Read data' do
      visit board_path(1200)
      expect(page).to have_content("The page you were looking for doesn't exist")
    end

    scenario 'Update board data' do
      click_on '更改名稱', match: :first
      fill_in board.name, with: 'Robert'
      click_on '更新'
      expect(page).to have_content('Robert')
    end

    scenario 'Delete board data' do
      click_on '刪除', match: :first
      page.driver.browser.switch_to.alert.accept
      visit boards_path
      # expect(page).not_to have_content('Title')
    end
  end
end
