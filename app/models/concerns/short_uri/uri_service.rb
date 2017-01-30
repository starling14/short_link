# Contains methods for creating and saving of uri
module Concerns::ShortUri::UriService
  extend ActiveSupport::Concern

  SHORT_URI_MIN_LENGTH = 4

  def save_short_uri
    self.update_column(:short_uri, generate_short_uri)
  end

  def generate_short_uri
    ShortUriGenerator.encode(self.id + offset_for_pk)
  end

  # generates offset for pk id for getting uri with specific length at the beginning
  def offset_for_pk
    @offset_for_pk ||= ShortUriGenerator.id_offset(SHORT_URI_MIN_LENGTH)
  end
end