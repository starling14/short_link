class ShortUrisController < ApplicationController
  def new
    @short_uri = ShortUri.new
  end

  def create
    url_handler = UrlHandler.new(short_uri_params[:user_url])

    short_uri_protocol = ShortUriProtocol.find_by name: url_handler.protocol

    @short_uri = short_uri_protocol.short_uris.create({user_url: url_handler.url_without_protocol})
  end

  def short_uri_params
    params[:short_uri]
  end
end
