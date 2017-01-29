require 'rails_helper'
require 'url_handler'

RSpec.describe UrlHandler do
  context 'url with protocol' do
    before(:all) do
      @url_handler = UrlHandler.new('https://cnn.com')
    end

    it 'return protocol from url' do
      expect(@url_handler.protocol).to eq('https')
    end

    it 'return url without protocol if it present' do
      expect(@url_handler.url_without_protocol).to eq('cnn.com')
    end
  end

  context 'url without protocol' do
    before(:all) do
      @url_handler = UrlHandler.new('cnn.com')
    end

    it 'return default protocol if it absent' do
      expect(@url_handler.protocol).to eq('http')
    end

    it 'return url without protocol if it absent' do
      expect(@url_handler.url_without_protocol).to eq('cnn.com')
    end
  end
end