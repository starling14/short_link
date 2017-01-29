require 'rails_helper'

RSpec.describe ShortUri, type: :model do
  before(:each) do
    @user_url = 'cnn.com?param=test'
    @protocol = ShortUriProtocol.create({name: 'http'})
    @s_uri = @protocol.short_uris.create({user_url: @user_url})
  end

  it 'should generate and save short uri' do
    expect(@s_uri.short_uri).to be_kind_of(String)
  end

  it 'should short_uri be 4 or more characters long' do
    expect(@s_uri.short_uri.length).to be >= 4
  end

  it { expect(@s_uri).to validate_presence_of(:user_url) }
  it { expect(@s_uri).to validate_length_of(:user_url).is_at_least(2).is_at_most(2000) }

  it { expect(@s_uri).to belong_to(:short_uri_protocol) }
end