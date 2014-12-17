require 'rails_helper'

RSpec.describe "add new recipe", :type => :feature do

  let(:user)   { FactoryGirl.create(:user) }
  let(:submit) { "Create Recipe" }

  before do
    @recipe = Recipe.new(name: "Example Recipe", body: "Directions", 
                         ingredients: "Ingreds", category_id: 1, user_id: 1)
    @category = Category.create(name: "Breakfasts")
    visit signin_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit new_recipe_path
  end 

  it "with valid information" do
    fill_in 'Name',        with: @recipe.name
    fill_in 'Body',        with: @recipe.body
    fill_in 'Ingredients', with: @recipe.ingredients
    select @category.name, from: "Category"
    click_button submit
    expect(page).to have_selector('div.flash-notice')
  end
  
  it "with invalid information" do
    fill_in 'Name',        with: "a" * 256
    fill_in 'Body',        with: " "
    fill_in 'Ingredients', with: " "
    click_button submit
    expect(page).to have_selector('div.flash-error')
  end
end