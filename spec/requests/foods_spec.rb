require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before :each do
    @user = User.create(name: 'User 1')
    @food = Food.create(name: 'Food 1', measurement_unit: '1', price: '23.1', quantity: 1, user: @user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/foods'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get food_path(@food)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_food_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_food_path(@food)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'updates the food' do
      patch food_path(@food), params: { food: { name: 'Updated Food' } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(food_path(@food))
      expect(flash[:notice]).to eq('Food was successfully updated.')
      @food.reload
      expect(@food.name).to eq('Updated Food')
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the food' do
      expect do
        delete food_path(@food)
      end.to change(Food, :count).by(-1)

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(foods_path)
      expect(flash[:notice]).to eq('Food was successfully destroyed.')
    end
  end
end
