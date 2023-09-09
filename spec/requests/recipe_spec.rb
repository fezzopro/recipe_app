require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before :each do
    @user = User.create!(name: 'User 1', email: 'email@gamil.com', password: '123456')
    @food = Food.create(name: 'Food 1', measurement_unit: '1', price: '23.1', quantity: 1, user: @user)
    @recipe = Recipe.create(name: 'Recipe 1', preparation_time: 'time', cooking_time: 'time',
                            description: 'Recipe 1 description', public: true, user: @user)
    puts @recipe
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/recipes'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/recipes/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET :id/edit' do
    it 'returns http success' do
      get '/recipes/'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /:id' do
    it 'returns http success' do
      get '/recipes/'
      expect(response).to have_http_status(302)
    end
  end
end
