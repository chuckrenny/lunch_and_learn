require 'rails_helper'

RSpec.describe ImagePoro do
  it 'creates an image poro based on attributes' do
    attr =  
        {
            "id": "yJ2SHIpNb9M",
            "slug": "time-lapse-photography-of-flying-hot-air-balloon-yJ2SHIpNb9M",
            "created_at": "2018-10-27T03:32:26Z",
            "updated_at": "2024-03-06T01:05:44Z",
            "promoted_at": nil,
            "width": 3888,
            "height": 2184,
            "color": "#f3d9c0",
            "blur_hash": "LnGSx=%KaKoJ~pxZodoL#Qaet7j[",
            "description": "The picture taken in Laos, 06:00, from hot baloon",
            "alt_description": "time lapse photography of flying hot air balloon",
            "breadcrumbs": [],
            "urls": {
                "raw": "https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=M3w1MjU5ODB8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTcwOTc0MzA4OXww&ixlib=rb-4.0.3"
            }}

    image = ImagePoro.new(attr)

    expect(image).to be_a(ImagePoro)

    expect(image.alt_tag).to be_a(String)
    expect(image.alt_tag).to eq("time lapse photography of flying hot air balloon")
    expect(image.url).to be_a(String)
    expect(image.url).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=M3w1MjU5ODB8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTcwOTc0MzA4OXww&ixlib=rb-4.0.3")
    end
end