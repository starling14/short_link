class ShortUri < ApplicationRecord
  SHORT_URI_MIN_LENGTH = 4

  belongs_to :short_uri_protocol

  validates_presence_of :user_url
  validates_length_of :user_url, in: 2..2000 # the least url in web - http://to -
  validates_format_of :user_url, with: /\A[a-zA-Z0-9]{1}[a-zA-Z0-9-]{1,}/ # very simple validation for allowing max urls quantity

  after_create :save_short_uri

  private
  def save_short_uri
    self.update_column(:short_uri, generate_short_uri)
  end

  def generate_short_uri
    ShortUriGenerator.encode(self.id + offset_for_pk)
  end

  def offset_for_pk
    @offset_for_pk ||= ShortUriGenerator.offset_by_chars_count(SHORT_URI_MIN_LENGTH)
  end
end
