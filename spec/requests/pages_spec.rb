require 'rails_helper'

RSpec.describe "Page", :type => :request do

  let(:base_title) { "Goodfood" }

  describe "Home" do
    it "should not have the content 'Home'" do
      visit root_path
      expect(page).not_to have_selector('h1', text: "Home")
    end

    it "should not have the title 'Home'" do
      visit root_path
      expect(page).to have_title(base_title)
    end
  end

  describe "Help" do
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("#{base_title} · Help")
    end
  end

  describe "About" do
    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit about_path
      expect(page).to have_title("#{base_title} · About")
    end
  end

  describe "Contact" do
    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("#{base_title} · Contact")
    end
  end
end
