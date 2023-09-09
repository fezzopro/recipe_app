require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before :each do
    @user = User.create(name: 'User 1', email: 'email@gamil.com', password: '123456')
    @food = Food.create(name: 'Food 1', measurement_unit: '1', price: '23.1', quantity: 1, user: @user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/foods'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get food_path(@food)
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_food_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_food_path(@food)
      expect(response).to have_http_status(302)
    end
  end

  describe 'PATCH /update' do
    it 'updates the food' do
      patch food_path(@food), params: { food: { name: 'Updated Food' } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
      @food.reload
      expect(@food.name).to eq('Food 1')
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the food' do
      expect do
        delete food_path(@food)
      end.to change(Food, :count).by(0)

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
