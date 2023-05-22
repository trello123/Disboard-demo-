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
      click_on '新增'
      click_on 'ABC'
    end

  context 'Create new card' do 
    
    scenario 'Create card data' do
      first('.addcard').click
      expect(page).to have_field('請輸入任務名稱')
      fill_in '請輸入任務名稱', with: 'Daisy'
      select "緊急", :from => "優先順序"
      # select ("21/12/1980", from:  "card_deadline")
      click_on '新增'
      expect(page).to have_content('Daisy')
      expect(page).to have_content('緊急')
      # expect(page).to have_content("21/12/1980")
    end

    scenario 'Invalid inputs' do
      first('.addcard').click
      expect(page).to have_field('請輸入任務名稱')
      click_on '新增'
      expect(page).to have_content('不能為空白')
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
      find("input[name='some_name']", make_visible: true)
      # first('.group/edit').
      visit edit_card_path(1)
      # first('.group-hover/edit:visible').click
      expect(page).to have_content('更新')
    end

    scenario 'Delete board data' do
      page.find('.group-hover:flex').trigger(:mouseover)
      # find('.first-letter:drop-shadow-2xl').hover
      find('.group-hover:flex').click
      click_link '刪除', match: :first
      click_button '確定'
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