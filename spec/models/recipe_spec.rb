require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'User 1')
    @food = Food.create(name: 'Food 1', measurement_unit: '1', price: '23.1', quantity: 1, user: @user)
  end

  describe 'Model Validations' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:public) }
  end

  describe 'Model Behavior' do
    it 'is not valid without a title' do
      expect(Recipe.new(name: 'Recipe 1', preparation_time: 'time', cooking_time: 'time',
                        description: 'Recipe 1 description', public: true, user: @user)).to be_valid
    end

    it 'is not valid without a name' do
      expect(Recipe.new(preparation_time: 'time', cooking_time: 'time',
                        description: 'Recipe 1 description', public: true, user: @user)).to_not be_valid
    end
    it 'is not valid without a description' do
      expect(Recipe.new(name: 'Recipe 1', preparation_time: 'time', cooking_time: 'time',
                        public: true, user: @user)).to_not be_valid
    end
    it 'is not valid without a user' do
      expect(Recipe.new(name: 'Recipe 1', preparation_time: 'time', cooking_time: 'time',
                        description: 'Recipe 1 description', public: true)).to_not be_valid
    end
    it 'is valid without a preparation_time' do
      expect(Recipe.new(name: 'Recipe 1', cooking_time: 'time',
                        description: 'Recipe 1 description', public: true, user: @user)).to be_valid
    end
    it 'is not valid without a cooking_time' do
      expect(Recipe.new(name: 'Recipe 1',
                        description: 'Recipe 1 description', public: true, user: @user)).to be_valid
    end
  end
end
