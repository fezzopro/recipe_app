require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many(:foods) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'attributes' do
    it { should respond_to(:name) }
  end
end
