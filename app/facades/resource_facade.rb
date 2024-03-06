class ResourceFacade
  def self.resources_search(q)
    service = ResourceService.new
    json = service.youtube_search(q)

    first_video = json[:items].first 
    result = ResourcePoro.new(first_video)
    
    # Check if !result.title.empty? is present and not empty
    if !result.title.empty? && !result.youtube_video_id.empty?
      {
      "title": result.title,
      "youtube_video_id": result.youtube_video_id
    }
    else
      # Return an empty hash if no videos are found
      {}
    end
  end
end