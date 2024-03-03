class RecipeService
  def conn
    Faraday.new(url: "https://api.edamam.com")
  end
  
  def get_url(url)
    response = conn.get(url) do |req|
      req.params[:app_id] = Rails.application.credentials.recipe_api[:app_id]
      req.params[:app_key] = Rails.application.credentials.recipe_api[:app_key]
      req.params[:type] = "public"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
  
  def country_search(country)
    get_url("/api/recipes/v2?q=#{country}")
  end
end