class UserUrlRedirect
  def initialize(app)
    @app = app
  end

  def call(env)
    uri = Rack::Request.new(env).path.gsub('/', '')
    if short_uri?(uri)
      pk_id = ShortUriGenerator.decode(uri)
      offset = ShortUriGenerator.id_offset(ShortUri::SHORT_URI_MIN_LENGTH)
      s_uri = ShortUri.find(pk_id - offset)
      [301, {'Location' => "#{s_uri.short_uri_protocol.name}://#{s_uri.user_url}"}, []]
    else
      @app.call(env)
    end
  end

  def short_uri?(path)
    !(path =~ /[euioaEUIOA]/) && path.length >= ShortUri::SHORT_URI_MIN_LENGTH
  end
end