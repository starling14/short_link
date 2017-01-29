class ShortUriProtocol < ApplicationRecord
  has_many :short_uris

  validates_presence_of :name
  validates_format_of :name, with: /[a-z]{3,5}/
end
