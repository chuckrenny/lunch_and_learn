require 'rails_helper'

RSpec.describe 'Air Quality Service' do
  it 'returns the air quality API data for a given country' do
    VCR.use_cassette('france_air_quality_results') do
      latlng = [46.0, 2.0]
      france_air_quality = AirQualityService.new.air_quality_data(latlng[0], latlng[1])

      expect(france_air_quality).to have_key(:coord)
      expect(france_air_quality[:coord]).to be_a(Hash)
      expect(france_air_quality).to have_key(:list)
      expect(france_air_quality[:list]).to be_a(Array)

      expect(france_air_quality[:list].first).to have_key(:main)
      expect(france_air_quality[:list].first).to have_key(:components)
      expect(france_air_quality[:list].first).to have_key(:dt)
    end
  end
end