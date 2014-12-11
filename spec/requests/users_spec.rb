require 'rails_helper'

RSpec.describe "Signups", :type => :request do
  let(:base_title) { "Goodfood" }

  describe "Sign up" do
    it "should have the content 'Sign up'" do
      visit signup_path
      expect(page).to have_selector('h1', text: "Sign up")
    end

    it "should have the title 'Sign up'" do
      visit signup_path
      expect(page).to have_title("#{base_title} · Sign up")
    end
  end
end
