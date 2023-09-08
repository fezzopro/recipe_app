require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/recipes'
      expect(response).to have_http_status(:success)
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
      get '/recipes/:id/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:id' do
    it 'returns http success' do
      get '/recipes/:id'
      expect(response).to have_http_status(:success)
    end
  end
end
