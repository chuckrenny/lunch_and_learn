require 'rails_helper'

RSpec.describe 'RecipeFacade' do 
  it 'should call the facade and return search results' do
    VCR.use_cassette('thailand_recipe_search_results') do
      country = 'thailand' 

      results = RecipeFacade.recipe_search(country)

      expect(results).to be_an(Array)

      first_recipe = results.first
      expect(first_recipe).to be_a(RecipePoro)
      expect(first_recipe.title).to eq('Andy Ricker\'s Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)')
      expect(first_recipe.url).to eq('http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9')
      expect(first_recipe.country).to eq('thailand')
      expect(first_recipe.image).to be_a(String)
    end
  end
end