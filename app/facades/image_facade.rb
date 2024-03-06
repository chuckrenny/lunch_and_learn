class ImageFacade
  def self.country_image_search(q)
    service = ImageService.new
    json = service.country_images(q)

    # Check if json[:results] is present and not empty
    if !json[:results].empty?
      json[:results].map do |image_data|
        ImagePoro.new(image_data)
      end
    else
      # Return an empty array if no images are found
      []
    end
  end
end