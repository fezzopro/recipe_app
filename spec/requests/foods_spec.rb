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

  # describe 'POST /create' do
  #   it 'creates a new food' do
  #     expect do
  #       post foods_path,
  #            params: { food: { name: 'New Food', measurement_unit: '2', price: '12.3', quantity: 2,
  #                              user_id: @user.id } }
  #     end.to change(Food, :count).by(1)

  #     expect(response).to have_http_status(:redirect)
  #     expect(response).to redirect_to(food_path(Food.last))
  #     expect(flash[:notice]).to eq('Food was successfully created.')
  #   end
  # end
  describe 'GET /edit' do
    it 'returns http success' do
      get edit_food_path(@food)
      expect(response).to have_http_status(:success)
    end
  end
end
