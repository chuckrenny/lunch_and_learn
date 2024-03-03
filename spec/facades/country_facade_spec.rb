require 'rails_helper'

RSpec.describe 'CountryFacade' do 
  it 'should call the facade and return a country' do
    VCR.use_cassette('return_one_country') do
      country = CountryFacade.random_country

      expect(country).to_not be_empty
      expect(country).to be_a(String)
    end
  end
end