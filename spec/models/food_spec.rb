require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.new(name: 'paul')
    subject { Food.new(name: 'Apple', measurement_unit: 'Piece', price: 1.99, quantity: 10, user_id: @user) }
  end

  describe 'validations' do
    it 'should be invalid for a blank name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid for negative price of the food' do
      subject.price = -1
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:measurement_unit) }
    it { should respond_to(:price) }
    it { should respond_to(:quantity) }
  end
end
