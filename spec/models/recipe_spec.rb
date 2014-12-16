require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  before do
    @recipe = Recipe.new(name: "Example recipe", body: "Cool cooking story",
                         ingredients: "Ingredients", category_id: 1, user_id: 1)
  end

  subject { @recipe }

  it { should respond_to(:name) }
  it { should respond_to(:body) }
  it { should respond_to(:ingredients) }
  it { should respond_to(:category_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:views) }

  it { should be_valid }

  describe "name is not present" do
    before { @recipe.name = " " }
    it { should_not be_valid }
  end

  describe "name is too long" do
    before { @recipe.name = "a" * 256 }
    it { should_not be_valid }
  end

  describe "body is not present" do
    before { @recipe.body = " " }
    it { should_not be_valid }
  end

  describe "ingredients is not present" do
    before { @recipe.ingredients = " " }
    it { should_not be_valid }
  end

  describe "category_id is not present" do
    before { @recipe.category_id = " " }
    it { should_not be_valid }
  end

  describe "user_id is not present" do
    before { @recipe.user_id = " " }
    it { should_not be_valid }
  end
end
