require 'rails_helper'

RSpec.describe "Recipes", :type => :request do

  let(:base_title) { "Goodfood" }

  let(:user) { FactoryGirl.create(:user) }

  before do
    visit signin_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  describe "New" do
    it "should have the content 'Add recipe'" do
      visit new_recipe_path
      expect(page).to have_selector('h1', text: "Add recipe")
    end

    it "should have the title 'Add recipe'" do
      visit new_recipe_path
      expect(page).to have_title("#{base_title} · Add recipe")
    end
  end
end
