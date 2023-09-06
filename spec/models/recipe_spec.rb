require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Model Validations' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:public) }
  end
end
