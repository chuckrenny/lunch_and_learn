require 'rails_helper'

RSpec.describe 'ResourceFacade' do 
  it 'should call the facade and return a data hash given a valid country' do
    VCR.use_cassette('laos_learning_resources') do
      country = "laos"
      data_hash = ResourceFacade.resources_search(country)

      expect(data_hash).to_not be_empty

      expect(data_hash[:title]).to be_a(String)
      expect(data_hash[:title]).to eq("A Super Quick History of Laos")
      expect(data_hash[:youtube_video_id]).to be_a(String)
      expect(data_hash[:youtube_video_id]).to eq("uw8hjVqxMXw")
    end
  end
end