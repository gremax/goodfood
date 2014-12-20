require 'rails_helper'

RSpec.describe "Categories", :type => :request do

  let(:base_title) { "Goodfood" }
  let(:user)       { FactoryGirl.create(:user) }

  before do 
    @category = Category.create(name: "Breads and Doughs")
    user.admin = true
    user.save
    visit signin_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  describe "List" do
    it "should have the content 'Categories'" do
      visit categories_path
      expect(page).to have_selector('h1', text: "Categories")
    end

    it "should have the title 'Categories'" do
      visit categories_path
      expect(page).to have_title("#{base_title} · Categories")
    end
  end

  describe "New" do
    it "should have the content 'New category'" do
      visit new_category_path
      expect(page).to have_selector('h1', text: "New category")
    end

    it "should have the title 'New category'" do
      visit new_category_path
      expect(page).to have_title("#{base_title} · New category")
    end
  end

  describe "Edit" do
    it "should have the content 'Edit category'" do
      visit edit_category_path(@category)
      expect(page).to have_selector('h1', text: "Edit category")
    end

    it "should have the title 'New category'" do
      visit edit_category_path(@category)
      expect(page).to have_title("#{base_title} · Edit category")
    end
  end

  describe "Show" do
    it "should have the content 'Breads and Doughs'" do
      visit category_path(@category)
      expect(page).to have_selector('h1', text: @category.name)
    end

    it "should have the title 'Breads and Doughs'" do
      visit category_path(@category)
      expect(page).to have_title("#{base_title} · #{@category.name}")
    end
  end

end
