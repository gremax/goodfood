require 'rails_helper'

RSpec.describe "new/edit category", :type => :feature do
  before :each do
    @category = Category.create(name: "Breads and Doughs")
  end

  it "add a new parent category" do
    visit new_category_path
    within(".new_category") do
      fill_in 'Name', with: "Breads and Doughs"
    end
    click_button 'Create Category'
    expect(page).to have_content "successfully"
  end

  it "with blank field" do
    visit new_category_path
    within(".new_category") do
      fill_in 'Name', with: "  "
    end
    click_button 'Create Category'
    expect(page).to have_content "some errors"
  end

  it "add a new child category" do
    visit new_category_path
    within(".new_category") do
      fill_in 'Name',              with: "Pizza"
      select  'Breads and Doughs', from: "category_parent_id"
    end
    click_button 'Create Category'
    expect(page).to have_content "successfully"
  end
end
