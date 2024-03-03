class RecipeFacade
  def self.recipe_search(q)
    service = RecipeService.new
    json = service.country_search(q)

    # Check if json[:hits] is present and not empty
    if !json[:hits].empty?
      json[:hits].map do |recipe_data|
        RecipePoro.new(recipe_data, q)
      end
    else
      # Return an empty array if no recipes are found
      []
    end
  end
end