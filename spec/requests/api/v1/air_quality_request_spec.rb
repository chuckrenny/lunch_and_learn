require 'rails_helper'

RSpec.describe 'Air Quality' do
  describe 'get air quality for a particular country' do
    describe 'happy path' do
      it 'receives a country from the user and looks up the air quality from the Open Weather API' do 
        VCR.use_cassette('france_air_quality_results') do
          get '/api/v1/air_quality?country=France'

          expect(response).to be_successful

          france_air_quality = JSON.parse(response.body, symbolize_names: true)

          expect(france_air_quality).to be_a(Hash)
          expect(france_air_quality[:data]).to be_a(Hash)

          expect(france_air_quality[:data]).to have_key(:id)
          expect(france_air_quality[:data]).to have_key(:type)
          expect(france_air_quality[:data]).to have_key(:attributes)

          expect(france_air_quality[:data][:attributes]).to have_key(:aqi)
          expect(france_air_quality[:data][:attributes][:aqi]).to be_a(Integer)
          expect(france_air_quality[:data][:attributes][:aqi]).to eq(2)

          expect(france_air_quality[:data][:attributes]).to have_key(:datetime)
          expect(france_air_quality[:data][:attributes][:datetime]).to be_a(Integer)
          expect(france_air_quality[:data][:attributes][:datetime]).to eq(1709584392)

          expect(france_air_quality[:data][:attributes]).to have_key(:readable_aqi)
          expect(france_air_quality[:data][:attributes][:readable_aqi]).to be_a(String)
          expect(france_air_quality[:data][:attributes][:readable_aqi]).to eq("Fair")
        end
      end
    end
  end
end