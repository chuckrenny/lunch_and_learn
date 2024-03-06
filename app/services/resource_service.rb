class ResourceService
  def conn
    Faraday.new(url: "https://www.googleapis.com")
  end
  
  def get_url(url)
    response = conn.get(url) do |req|
      req.params[:key] = Rails.application.credentials.youtube_api[:key]
      req.params[:part] = "snippet"
      req.params[:channelId] = 'UCluQ5yInbeAkkeCndNnUhpw' # @MrHistory1
    end

    JSON.parse(response.body, symbolize_names: true)
  end
  
  def youtube_search(country)
    get_url("/youtube/v3/search?q=#{country}")
  end
end