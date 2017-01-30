class ShortUri < ApplicationRecord
  include Concerns::ShortUri::UriService

  belongs_to :short_uri_protocol

  validates_presence_of :user_url
  validates_length_of :user_url, in: 2..2000 # the least url in web - http://to -
  validates_format_of :user_url, with: /\A[a-zA-Z0-9]{1}[a-zA-Z0-9-]{1,}/ # very simple validation for allowing max urls quantity

  after_create :save_short_uri

  def user_url_with_protocol
    "#{short_uri_protocol.name}://#{user_url}"
  end
end
