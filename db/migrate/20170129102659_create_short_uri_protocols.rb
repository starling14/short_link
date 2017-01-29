class CreateShortUriProtocols < ActiveRecord::Migration[5.0]
  def change
    create_table :short_uri_protocols do |t|
      t.string :name, limit: 5

      t.timestamps
    end
  end
end
