require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new card' do
    before(:each) do
      visit '/'
    end

    scenario 'registration' do
      click_on '註冊'
      visit new_user_registration_path
      expect(page).to have_content('確認密碼')
    end

    scenario 'login' do
      click_on '登入'
      visit new_user_session_path
      expect(page).to have_content('記住我的資訊')
    end
  end
end
