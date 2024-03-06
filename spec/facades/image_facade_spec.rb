require 'rails_helper'

RSpec.describe 'ImageFacade' do 
  it 'should call the facade and return 10 images given a country' do
    VCR.use_cassette('return_ten_images_for_a_country') do
      country = "laos"
      images = ImageFacade.country_image_search(country)

      expect(images).to_not be_empty
      expect(images.first).to be_a(ImagePoro)
      expect(images.first.alt_tag).to be_a(String)
      expect(images.first.alt_tag).to eq("time lapse photography of flying hot air balloon")
      expect(images.first.url).to be_a(String)
      expect(images.first.url).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=M3w1MjU5ODB8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTcwOTc0MzYxOHww&ixlib=rb-4.0.3")
    end
  end
end