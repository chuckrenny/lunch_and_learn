require 'rails_helper'

RSpec.describe AirQualityPoro do
  it 'creates a air quality poro based on attributes' do
    attr =  
    {
      "coord": {
          "lon": 2,
          "lat": 46
      },
      "list": 
      [
        {
          "main": {
              "aqi": 2
          },
          "components": {
              "co": 223.64,
              "no": 0,
              "no2": 1.35,
              "o3": 88.69,
              "so2": 0.1,
              "pm2_5": 1.16,
              "pm10": 1.31,
              "nh3": 2.76
          },
          "dt": 1709585125
        }
      ]
    }

    france_air_quality = AirQualityPoro.new(attr)

    expect(france_air_quality).to be_a(AirQualityPoro)

    expect(france_air_quality.aqi).to be_a(Integer)
    expect(france_air_quality.aqi).to eq(2)
    expect(france_air_quality.datetime).to be_a(Integer)
    expect(france_air_quality.datetime).to eq(1709585125)
    expect(france_air_quality.readable_aqi).to be_a(String)
    expect(france_air_quality.readable_aqi).to eq("Fair")
  end
end