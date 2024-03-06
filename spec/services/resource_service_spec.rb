require 'rails_helper'

RSpec.describe 'Resource Service' do
  it 'returns the youtube country input from the channel MrHistory1' do
    VCR.use_cassette('laos_learning_resources') do
      country = "laos"
      results = ResourceService.new.youtube_search(country)

      expect(results[:items].first[:snippet]).to have_key(:channelId)
      expect(results[:items].first[:snippet]).to have_key(:title)

      expect(results[:items].first[:snippet][:channelId]).to be_a(String)
      expect(results[:items].first[:snippet][:channelId]).to eq("UCluQ5yInbeAkkeCndNnUhpw")
      expect(results[:items].first[:snippet][:title]).to be_a(String)
      expect(results[:items].first[:snippet][:title]).to eq("A Super Quick History of Laos")
    end
  end
end