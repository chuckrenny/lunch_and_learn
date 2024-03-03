class RecipeFacade
  def self.recipe_search(q)
    service = RecipeService.new
    json = service.country_search(q)

    json[:hits].map do |recipe_data|
      RecipePoro.new(recipe_data, q)
    end
  end
end