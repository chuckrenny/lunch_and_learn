require 'rails_helper'

RSpec.describe 'Learning Resources' do
  describe 'get YT learning resources for a particular country' do
    describe 'happy path' do
      it 'receives a country from the user and looks up learning resources from the Youtube API' do 
        VCR.use_cassette('laos_learning_resources') do
          get '/api/v1/learning_resources?country=laos'

          expect(response).to be_successful

          resources = JSON.parse(response.body, symbolize_names: true)

          expect(resources).to be_a(Hash)

          expect(resources[:data]).to be_a(Hash)
          expect(resources[:data][:id]).to be(nil)

          expect(resources[:data][:type]).to eq("resource")
          expect(resources[:data][:attributes]).to be_a(Hash)
          expect(resources[:data][:attributes]).to have_key(:country)
          expect(resources[:data][:attributes]).to have_key(:video)
          expect(resources[:data][:attributes]).to have_key(:images)

          expect(resources[:data][:attributes][:country]).to be_a(String)
          expect(resources[:data][:attributes][:country]).to eq("laos")
          expect(resources[:data][:attributes][:video]).to be_a(Hash)
          expect(resources[:data][:attributes][:video]).to have_key(:title)
          expect(resources[:data][:attributes][:video]).to have_key(:youtube_video_id)

          expect(resources[:data][:attributes][:video][:title]).to be_a(String)
          expect(resources[:data][:attributes][:video][:title]).to eq("A Super Quick History of Laos")
          expect(resources[:data][:attributes][:video][:youtube_video_id]).to be_a(String)
          expect(resources[:data][:attributes][:video][:youtube_video_id]).to eq("uw8hjVqxMXw")

          expect(resources[:data][:attributes][:images].length).to eq(10)
          expect(resources[:data][:attributes][:images].first).to have_key(:alt_tag)
          expect(resources[:data][:attributes][:images].first).to have_key(:url)
          expect(resources[:data][:attributes][:images].first[:alt_tag]).to be_a(String)
          expect(resources[:data][:attributes][:images].first[:alt_tag]).to eq("time lapse photography of flying hot air balloon")
          expect(resources[:data][:attributes][:images].first[:url]).to be_a(String)
          expect(resources[:data][:attributes][:images].first[:url]).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=M3w1MjU5ODB8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTcwOTc0MzYxOHww&ixlib=rb-4.0.3")
        end
      end
    end
  end
end