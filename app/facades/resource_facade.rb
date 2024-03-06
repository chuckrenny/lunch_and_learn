class ResourceFacade
  def self.resources_search(q)
    service = ResourceService.new
    json = service.youtube_search(q)

    first_video = json[:items].first 
    
    # Check if first_video is not nil 
    if !first_video.nil?
      result = ResourcePoro.new(first_video)
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