require 'rails_helper'

RSpec.feature "Users", type: :feature, js: true do
  context 'Visit boards path' do
    before(:each) do
      visit root_path
    end

    scenario 'Registration' do
      click_on '註冊', match: :first
      visit new_user_registration_path
      expect(page).to have_content('確認密碼')
      fill_in '暱稱', with: 'aa'
      fill_in '信箱', with: 'aa@aa.aa'
      fill_in '密碼', with: '123456'
      fill_in '確認密碼', with: '123456'
      visit boards_path
    end

    scenario 'Login' do
      click_on '登入', match: :first
      expect(page).to have_content('還沒有帳號嗎？')
      visit new_user_session_path
      fill_in '信箱', with: 'aa@aa.aa'
      fill_in '密碼', with: '123456'
      visit boards_path
    end
  end
end
