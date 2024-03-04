require 'rails_helper'

RSpec.describe 'Learning Resources' do
  describe 'get YT learning resources for a particular country' do
    describe 'happy path' do
      it 'receives a country from the user and looks up learning resources from the Youtube API' do 
        VCR.use_cassette('laos_learning_resources') do
          get '/api/v1/learning_resources?country=laos'

          expect(response).to be_successful
require 'pry';binding.pry
          resources = JSON.parse(response.body, symbolize_names: true)

          expect(resources).to be_a(Hash)
          require 'pry';binding.pry
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
        end
      end
    end
  end
end