class ResourceSerializer
  include JSONAPI::Serializer
  attributes :country, :video, :images
  end