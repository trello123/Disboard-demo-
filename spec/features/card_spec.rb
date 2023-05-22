require 'rails_helper'

RSpec.describe Card, type: :feature do
  before(:each) do
    user = FactoryBot.create(:user)
    login_as user
    board = FactoryBot.create(:board)
    container = FactoryBot.create(:container)
    visit board_path(board.id)
    card = FactoryBot.create(:card)
  end

  context 'create new card' do 
    # before(:each) do
    #   visit new_card_path
    #   fill_in '標題', with: 'Title'
    #   fill_in '簡介', with: 'intro123'
    # end
    
   
    scenario 'valid inputs' do
      click_on '新增任務'
      expect(page).to have_content('任務名稱')
    end
  end

  context 'Card Actions' do 
    # before(:each) do
    #   card = FactoryBot.create(:card)
    #   visit cards_path
    # end

    scenario 'Read Card data' do
      click_link card_path(card.id)
      expect(page).to have_content('標題')
    end

    scenario 'valid Read data' do
      visit card_path(1200)
      expect(page).to have_content("404")
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