require 'rails_helper'

RSpec.describe "new/edit category", :type => :feature do

  let(:user)   { FactoryGirl.create(:user) }
  let(:submit) { "Create Category" }
      
  describe "user is admin" do

    before do
      @category = Category.create(name: "Breads and Doughs")
      user.admin = true
      user.save
      visit signin_path
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      visit new_category_path
    end

    it "add a new parent category" do
      within("#new_category") do
        fill_in 'Name', with: "Breads and Doughs"
      end
      click_button submit
      expect(page).to have_selector('div.flash-notice')
    end

    it "with blank field" do
      within("#new_category") do
        fill_in 'Name', with: "  "
      end
      click_button submit
      expect(page).to have_selector('div.flash-error')
    end

    it "add a new child category" do
      within("#new_category") do
        fill_in 'Name',              with: "Pizza"
        select  'Breads and Doughs', from: "category_parent_id"
      end
      click_button submit
      expect(page).to have_selector('div.flash-notice')
    end  
  end

  describe "access denied" do
    
    before do
      visit signin_path
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      visit new_category_path
    end
    
    it "user is not admin" do
      expect(page.current_path).to eq root_path
      expect(page).to have_selector('div.flash-error')
    end
  end
end
