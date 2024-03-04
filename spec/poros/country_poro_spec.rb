require 'rails_helper'

RSpec.describe CountryPoro do
  it 'creates a country poro based on attributes' do
    attr =  
    {
        "name": {
            "common": "Cyprus",
            "official": "Republic of Cyprus",
            "nativeName": {
                "ell": {
                    "official": "Δημοκρατία της Κύπρος",
                    "common": "Κύπρος"
                },
                "tur": {
                    "official": "Kibris Cumhuriyeti",
                    "common": "Kibris"
                }
            }
        },
        "tld": [
            ".cy"
        ]
    }

    country = CountryPoro.new(attr)

    expect(country).to be_a(CountryPoro)
    expect(country.name).to be_a(String)
    expect(country.name).to eq("Cyprus")
  end
end