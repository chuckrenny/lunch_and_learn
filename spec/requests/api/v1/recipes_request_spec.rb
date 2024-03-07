require 'rails_helper'

RSpec.describe 'Recipes Request API' do
  describe 'get Recipes for a particular country' do
    describe 'happy path' do
      it 'receives a country from the user and looks up recipes from the Recipe API' do 
        VCR.use_cassette('thailand_recipe_search_results') do
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

      it 'doesn\'t receive a country input from user so it randomly selects one from the REST country API and looks up recipes from the Recipe API', :vcr do
        get '/api/v1/recipes?country='

        expect(response).to be_successful

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a(Hash)
        expect(recipes[:data]).to be_a(Array)

        if !recipes[:data].empty?
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

    describe 'sad path' do
      # If the country parameter is either an empty string, or a value that 
      # doesn’t return any recipes, return an empty array
      it 'returns an empty data set if country parameter is an empty string' do
        VCR.use_cassette('empty_country_parameter') do
          get '/api/v1/recipes?country= '

          expect(response).to be_successful

          recipes = JSON.parse(response.body, symbolize_names: true)

          expect(recipes).to be_a(Hash)
          expect(recipes[:data]).to be_a(Array)
          expect(recipes[:data]).to be_empty
        end
      end

      it 'returns an empty data set if country parameter is an invalid string' do
        VCR.use_cassette('invalid_country_parameter') do
          get '/api/v1/recipes?country=438594'

          expect(response).to be_successful

          recipes = JSON.parse(response.body, symbolize_names: true)

          expect(recipes).to be_a(Hash)
          expect(recipes[:data]).to be_a(Array)
          expect(recipes[:data]).to be_empty
        end
      end
    end
  end
end