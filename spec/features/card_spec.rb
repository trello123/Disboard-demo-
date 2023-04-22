require 'rails_helper'

RSpec.describe Card, type: :feature do
  before(:each) do
    visit '/'
    user = User.create(email: 'aa@aa.aa', encrypted_password: '123456')
    click_on '登入'
    visit boards_path
  end

  context 'create new card' do 
    before(:each) do
      visit new_card_path
      fill_in '標題', with: 'Title'
      fill_in '簡介', with: 'intro123'
    end
    
   
    scenario 'valid inputs' do
      click_on '建立項目'
      visit cards_path
      expect(page).to have_content('Title')
    end
  end

  context 'Card Actions' do 
    before(:each) do
      card = Card.create(title: 'Title',intro: 'testing', level: '普通')
      visit cards_path
    end

    scenario 'Read Card data' do
      click_on 'Title'
      expect(page).to have_content('標題')
    end

    scenario 'valid Read data' do
      visit card_path(1200)
      expect(page).to have_content("The page you were looking for doesn't exist")
    end

    scenario 'Update Card data' do
      click_on '更新', match: :first
      fill_in '標題', with: 'Robert'
      click_on '建立項目'
      expect(page).to have_content('Robert')
    end

    scenario 'Delete Card data' do
      click_on '刪除', match: :first
      page.driver.browser.switch_to.alert.accept
      visit cards_path
      # expect(page).not_to have_content('Title')
    end
  end
end