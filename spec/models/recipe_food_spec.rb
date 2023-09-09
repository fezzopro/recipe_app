require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'User 1', email: 'email@gamil.com', password: '123456')
    @food = Food.create(name: 'Food 1', measurement_unit: '1', price: '23.1', quantity: 1, user: @user)
    @recipe = Recipe.new(name: 'Recipe 1', preparation_time: 'time', cooking_time: 'time',
                         description: 'Recipe 1 description', public: true, user: @user)
  end

  describe 'Model Association' do
    it { should belong_to(:recipe) }
    it { should belong_to(:food) }
  end

  describe 'Model Attributes' do
    it { should respond_to(:quantity) }
  end

  describe 'Model Behavior' do
    it 'is valid with valid attributes' do
      expect(RecipeFood.new(quantity: 1.2, recipe: @recipe, food: @food)).to be_valid
    end
    it 'is not valid without quantity' do
      expect(RecipeFood.new).to_not be_valid
    end
    it 'is not valid without a Recipe' do
      expect(RecipeFood.new(quantity: 1.2)).to_not be_valid
    end
    it 'is not valid without a food' do
      expect(RecipeFood.new(quantity: 1.2, recipe: @recipe)).to_not be_valid
    end
  end
end
