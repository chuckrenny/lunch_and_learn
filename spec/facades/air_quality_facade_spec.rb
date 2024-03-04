require 'rails_helper'

RSpec.describe 'AirQualityFacade' do 
  it 'should call the facade and return a country' do
    VCR.use_cassette('france_air_quality_results') do
      latlng = [46.0, 2.0]
      france_air_quality = AirQualityFacade.air_quality_results(latlng)

      expect(france_air_quality).to be_a(AirQualityPoro)

      expect(france_air_quality.aqi).to be_a(Integer)
      expect(france_air_quality.datetime).to be_a(Integer)
      expect(france_air_quality.readable_aqi).to be_a(String)
    end
  end
end