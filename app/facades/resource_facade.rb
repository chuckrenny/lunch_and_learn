class ResourceFacade
  def self.resources_search(q)
    service = ResourceService.new
    json = service.youtube_search(q)

    first_video = json[:items].first 
    result = ResourcePoro.new(first_video)
    require 'pry';binding.pry
    
    # # Check if json[:hits] is present and not empty
    # if !json[:hits].empty?
    #   json[:hits].map do |recipe_data|
    #     RecipePoro.new(recipe_data, q)
    #   end
    # else
    #   # Return an empty array if no recipes are found
    #   []
    # end
  end
end