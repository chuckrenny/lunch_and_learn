class ImageService
  def conn
    Faraday.new(url: "https://api.unsplash.com")
  end

  def get_url(url)
    response = conn.get(url) do |req| 
      req.params[:client_id] = Rails.application.credentials.unsplash_api[:client_id]
    end

    JSON.parse(response.body, symbolize_names: true)
  end
  
  def country_images(country)
    get_url("search/photos?query=#{country}&page=1&per_page=10")
  end
end