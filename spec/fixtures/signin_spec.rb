require 'rails_helper'

RSpec.describe "the signin process", :type => :feature do
  before :each do
    @user = User.create(name: "Omar Crab", email: "omar.crab@example.com", 
                        password: "foobar", password_confirmation: "foobar")
  end

  it "signs me in" do
    visit signin_path
    within(".session") do
      fill_in 'Email',    with: "omar.crab@example.com"
      fill_in 'Password', with: "foobar"
    end
    click_button 'Sign in'
    expect(page).to have_content "Hi, #{@user.name}!"
  end

  it "with invalid combination email/password" do
    visit signin_path
    within(".session") do
      fill_in 'Email',    with: "  "
      fill_in 'Password', with: "  "
    end
    click_button 'Sign in'
    expect(page).to have_content "Invalid email/password combination!"
  end

  it "signs me out" do
    visit signin_path
    within(".session") do
      fill_in 'Email',    with: "omar.crab@example.com"
      fill_in 'Password', with: "foobar"
    end
    click_button 'Sign in'
    visit root_path
    click_link 'Sign Out'
    expect(page).to have_content "See you later"
  end
end
