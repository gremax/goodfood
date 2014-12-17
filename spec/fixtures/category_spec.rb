require 'rails_helper'

RSpec.describe "new/edit category", :type => :feature do

  before do
    @category = Category.create(name: "Breads and Doughs")
    visit new_category_path
  end
  
  let(:submit) { "Create Category" }

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
