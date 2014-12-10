require 'rails_helper'

RSpec.describe "the signup process", :type => :request do
  it "successfully signed up" do
    visit signup_path
    within("#new_user") do
      fill_in 'Name',     with: "Omar Crab"
      fill_in 'Email',    with: "omar.crab@example.com"
      fill_in 'Password', with: "foobar"
      fill_in 'Password confirmation', with: "foobar"
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome aboard!'
  end

  it "sign up error" do
    visit signup_path
    within("#new_user") do
      fill_in 'Name',     with: ""
      fill_in 'Email',    with: ""
      fill_in 'Password', with: ""
      fill_in 'Password confirmation', with: ""
    end
    click_button 'Sign up'
    expect(page).to have_content 'Form contains some errors'
  end
end