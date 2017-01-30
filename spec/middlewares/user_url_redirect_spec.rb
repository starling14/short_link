require 'rails_helper'
require 'user_url_redirect'

describe UserUrlRedirect do
  let(:app) { proc{[200,{},[]]} }
  let(:stack) { UserUrlRedirect.new(app) }
  let(:request) { Rack::MockRequest.new(stack) }

  before {
    @user_url = 'http://cnn.com'
    @url_handler = UrlHandler.new(@user_url)
    @protocol = ShortUriProtocol.create({name: 'http'})
    @s_uri = @protocol.short_uris.create({user_url: @url_handler.url_without_protocol})
  }

  let(:response) { request.get("/#{@s_uri.short_uri}") }

  it 'returns Location header with stored user url' do
    expect(response.headers['Location']).to eq(@user_url)
  end

  it 'doing redirect' do
    expect(response.redirection?).to eq(true)
  end
end