require 'rails_helper'

RSpec.describe ResourcePoro do
  it 'creates an image poro based on attributes' do
    attr =  
    {
            "kind": "youtube#searchResult",
            "etag": "hJ88n1jJJqL46_ZS7iMmglTcW50",
            "id": {
                "kind": "youtube#video",
                "videoId": "uw8hjVqxMXw"
            },
            "snippet": {
                "publishedAt": "2021-08-29T10:13:10Z",
                "channelId": "UCluQ5yInbeAkkeCndNnUhpw",
                "title": "A Super Quick History of Laos",
                "description": "Audio Requiring Attribution: LukeIRL: https://freesound.org/people/LukeIRL/sounds/176134/ RTB45: ..."
            }}

    yt_resource = ResourcePoro.new(attr)

    expect(yt_resource).to be_a(ResourcePoro)

    expect(yt_resource.title).to be_a(String)
    expect(yt_resource.title).to eq("A Super Quick History of Laos")
    expect(yt_resource.youtube_video_id).to be_a(String)
    expect(yt_resource.youtube_video_id).to eq("uw8hjVqxMXw")
  end
end