require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:measurement_unit) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity) }
  end

  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:measurement_unit) }
    it { should respond_to(:price) }
    it { should respond_to(:quantity) }
  end
end
