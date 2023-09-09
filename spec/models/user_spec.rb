require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'User 1', email: 'email@gamil.com', password: '123456') }
  before { subject.save }

  describe 'association' do
    it { should have_many(:foods) }
  end

  describe 'validations' do
    it 'should be invalid for a blank name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid for a given name' do
      expect(subject).to be_valid
    end
  end

  describe 'attributes' do
    it { should respond_to(:name) }
  end
end
