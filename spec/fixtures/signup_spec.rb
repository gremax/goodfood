require 'rails_helper'

RSpec.describe "the signup process", :type => :feature do

  before { visit signup_path }

  let(:submit) { "Sign up" }

  it "successfully signed up" do
    within("#new_user") do
      fill_in 'Name',          with: "Omar Crab"
      fill_in 'Email',         with: "omar.crab@example.com"
      fill_in 'user_password', with: "foobar"
      fill_in 'user_password_confirmation', with: "foobar"
    end
    expect { click_button submit }.to change(User, :count).by(1)
    expect(page).to have_selector('div.flash-success')
  end

  it "sign up error" do
    within("#new_user") do
      fill_in 'Name',          with: ""
      fill_in 'Email',         with: ""
      fill_in 'user_password', with: ""
      fill_in 'user_password_confirmation', with: ""
    end
    expect { click_button submit }.not_to change(User, :count)
    expect(page).to have_selector('div.flash-error')
  end
end
