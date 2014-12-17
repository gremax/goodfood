require 'rails_helper'

RSpec.describe "the signin process", :type => :feature do

  before { visit signin_path }

  describe "with valid information" do
  
    let(:user) { FactoryGirl.create(:user) }
    
    before do
        fill_in 'Email',    with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign in'
    end

    it "signs me in" do
      expect(page).to     have_content "Hi, #{user.name}!"
      expect(page).to     have_link('Sign Out', href: signout_path)
      expect(page).not_to have_link('Sign In',  href: signin_path)
    end

    it "signs me out" do
      click_link 'Sign Out'
      expect(page).to have_content "See you later"
    end

    it "logged in user redirect" do
      visit signup_path
      expect(page.current_path).to eq root_path
      visit signin_path
      expect(page.current_path).to eq root_path
    end
  end

  it "with blank email/password" do
    click_button 'Sign in'
    expect(page).to have_content "Invalid email/password combination!"
  end
end
