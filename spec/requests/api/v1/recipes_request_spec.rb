require 'rails_helper'

RSpec.describe 'Recipes' do
  describe 'get Recipes for a particular country' do
    it 'receives a country from the user and looks up recipes from the Recipe API' do 
      get '/api/v1/recipes?country=thailand'

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes[:data]).to be_a(Array)
      
      first_recipe = recipes[:data].first 

      expect(first_recipe).to have_key(:id)
      expect(first_recipe).to have_key(:type)
      expect(first_recipe).to have_key(:attributes)
      expect(first_recipe[:attributes]).to have_key(:title)
      expect(first_recipe[:attributes]).to have_key(:url)
      expect(first_recipe[:attributes]).to have_key(:country)
      expect(first_recipe[:attributes]).to have_key(:image)
      expect(first_recipe[:attributes]).to_not have_key(:images)
      expect(first_recipe[:attributes]).to_not have_key(:ingredients)
    end
  end
end