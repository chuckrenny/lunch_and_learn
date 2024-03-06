require 'rails_helper'

RSpec.describe 'Image Service' do
  it 'returns the country images' do
    VCR.use_cassette('laos_learning_resources') do
      country = "laos"
      results = ImageService.new.country_images(country)

      first_photo = results[:results].first

      expect(first_photo).to have_key(:alt_description)
      expect(first_photo).to have_key(:urls)
      expect(first_photo[:alt_description]).to be_a(String)
      expect(first_photo[:alt_description]).to eq("time lapse photography of flying hot air balloon")

      expect(first_photo[:urls]).to have_key(:raw)
      expect(first_photo[:urls][:raw]).to be_a(String)
      expect(first_photo[:urls][:raw]).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=M3w1MjU5ODB8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTcwOTc0MzYxOHww&ixlib=rb-4.0.3")
    end
  end
end