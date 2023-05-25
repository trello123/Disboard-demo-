require 'rails_helper'

RSpec.describe Card, type: :feature, js: true do
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
      click_on 'ABC'
    end

  context 'Create new card' do 
    scenario 'Create card data' do
      first('.addcard').click
      expect(page).to have_field('請輸入任務名稱')
      fill_in '請輸入任務名稱', with: 'Daisy'
      select "緊急", :from => "優先順序"
      click_on '新增'
      expect(page).to have_content('Daisy')
      expect(page).to have_content('緊急')
    end
  end

  context 'Card actions' do 
    before do
      first('.addcard').click
      expect(page).to have_field('請輸入任務名稱')
      fill_in '請輸入任務名稱', with: 'Daisy'
      click_on '新增'
      expect(page).to have_content('Daisy')
    end

    scenario 'Valid Read data' do
      visit card_path(1200)
      expect(page).to have_content("404")
    end

    scenario 'Show card data' do
      click_on 'Daisy'
      expect(page).to have_content('新增評論')
    end

    scenario 'Update card data' do
      first(".cursor-grabbing").hover
      first(".invisible", visible: :false)
      first(".fa-pencil").click
      expect(page).to have_content('更新')
      fill_in '任務名稱', with: 'Daily'
      click_on '更新'
      visit board_path(1)
    end

    scenario 'Delete card data' do
      first(".cursor-grabbing").hover
      first(".invisible", visible: :false)
      first(".fa-pencil").click
      first(".fa-trash-can").click
      click_button '確定'
      expect(page).not_to have_content('Daisy')
    end

    scenario 'Cancel delete card data' do
      first(".cursor-grabbing").hover
      first(".invisible", visible: :false)
      first(".fa-pencil").click
      first(".fa-trash-can").click
      click_button '取消'
      expect(page).to have_content('Daisy')
    end

  end
end