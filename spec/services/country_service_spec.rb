require 'rails_helper'

RSpec.describe 'Country Service' do
  it 'returns the country API' do
    VCR.use_cassette('all_countries_results') do
      results = CountryService.new.all_countries

      first_country = results.first

      expect(first_country).to have_key(:name)
      expect(first_country).to have_key(:tld)
      expect(first_country[:name]).to be_a(Hash)

      expect(first_country[:name]).to have_key(:common)
      expect(first_country[:name][:common]).to be_a(String)
      expect(first_country[:name][:common]).to eq("Cyprus")
    end
  end
end