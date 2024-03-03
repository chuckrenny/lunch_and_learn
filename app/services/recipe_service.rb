class RecipeService
  def conn
    Faraday.new(url: "https://api.edamam.com")
  end
  # https://api.edamam.com/api/recipes/v2?app_id=fba2882e&
  # app_key=52f07a67f54472731684cccbd16724ec&type=public&q=Italy
  
  def get_url(url)
    response = conn.get(url) do |req|
      req.params[:app_id] = Rails.application.credentials.recipe_api[:app_id]
      req.params[:app_key] = Rails.application.credentials.recipe_api[:app_key]
      req.params[:type] = "public"
    end
# require 'pry';binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def country_search(country)
    get_url("/api/recipes/v2?q=#{country}")
  end
end