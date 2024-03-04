require 'rails_helper'

RSpec.describe 'Recipe Service' do
  it 'searches recipe API based on a country input' do
    VCR.use_cassette('thailand_recipe_search_results') do
      country = 'thailand' 

      results = RecipeService.new.country_search(country)

      expect(results).to have_key(:_links)
      expect(results).to have_key(:hits)
      expect(results[:hits]).to be_a(Array)

      first_recipe = results[:hits].first

      expect(first_recipe).to have_key(:recipe)

      expect(first_recipe[:recipe]).to have_key(:uri)
      expect(first_recipe[:recipe][:uri]).to be_a(String)
      expect(first_recipe[:recipe][:uri]).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9")

      expect(first_recipe[:recipe]).to have_key(:label)
      expect(first_recipe[:recipe][:label]).to be_a(String)
      expect(first_recipe[:recipe][:label]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")

      expect(first_recipe[:recipe]).to have_key(:label)
      expect(first_recipe[:recipe][:image]).to be_a(String)
    end
  end
end