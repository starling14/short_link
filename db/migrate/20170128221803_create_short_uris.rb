class CreateShortUris < ActiveRecord::Migration[5.0]
  def change
    create_table :short_uris, id: :bigserial do |t|
      t.string :short_uri, :limit => 14 # because max bigserial type value is 9223372036854775807 and it was encoded to 9x2xCmkv4V9nGY
      t.string :user_url, :limit => 2000 # because it is recommended max url length

      t.timestamps
    end
  end
end
