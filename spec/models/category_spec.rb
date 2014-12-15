require 'rails_helper'

RSpec.describe Category, :type => :model do
  before { @category = Category.new(name: "Breads and Doughs") }

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:ancestry) }

  it { should be_valid }

  describe "name is not present" do
    before { @category.name = " " }
    it { should_not be_valid }
  end
end
