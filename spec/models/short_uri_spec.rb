require 'rails_helper'

RSpec.describe ShortUri, type: :model do
  def create_models(user_url)
    @user_url = user_url
    @protocol = ShortUriProtocol.create({name: 'http'})
    @s_uri = @protocol.short_uris.create({user_url: @user_url})
  end

  context "with valid attributes" do
    before(:all) do
      create_models('cnn.com?param=test')
    end

    it 'create short_uri kind of String' do
      expect(@s_uri.short_uri).to be_kind_of(String)
    end

    it 'create short_uri 4 or more characters long' do
      expect(@s_uri.short_uri.length).to be >= 4
    end

    it { expect(@s_uri).to validate_presence_of(:user_url) }
    it { expect(@s_uri).to validate_length_of(:user_url).is_at_least(2).is_at_most(2000) }

    it { expect(@s_uri).to belong_to(:short_uri_protocol) }
  end

  context "with invalid attributes" do
    before(:all) do
      create_models('*=cnn.com?param=test')
    end

    it 'create short_uri kind of String' do
      expect(@s_uri.short_uri).to eq(nil)
    end
  end
end