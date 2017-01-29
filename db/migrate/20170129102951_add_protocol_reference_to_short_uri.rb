class AddProtocolReferenceToShortUri < ActiveRecord::Migration[5.0]
  def change
    add_reference :short_uris, :short_uri_protocol, foreign_key: true
  end
end
