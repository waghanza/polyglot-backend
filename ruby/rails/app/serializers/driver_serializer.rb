class DriverSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer
  singleton_class.include Rails.application.routes.url_helpers

  attributes :name, :lat, :long

  link :create do |object|
    driver_book_index_url(object.id)
  end
end
