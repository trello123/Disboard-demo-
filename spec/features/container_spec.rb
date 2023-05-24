require 'rails_helper'

RSpec.feature "Containers", type: :feature, js: true do
  context 'Container actions' do 
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

    scenario 'Create container data' do
      find('.floating-btn').click
      find('.fa-clipboard').click
      expect(page).to have_field('請輸入狀態名稱')
      fill_in '請輸入狀態名稱', with: 'Bobby'
      click_on '新增'
      expect(page).to have_content('Bobby')
    end

    scenario 'Valid Read data' do
      visit container_path(1200)
      expect(page).to have_content("404")
    end

    scenario 'Update container data' do
      expect(page).to have_content('已完成')
      click_on '已完成'
      click_on '更新'
      expect(page).to have_content('已完成')
    end

    scenario 'Delete container data' do
      first(".bg-white-2").hover
      find(".fa-xmark").click
      find(".fa-xmark").click
    end
  end
end
