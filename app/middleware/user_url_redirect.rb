class UserUrlRedirect
  def initialize(app)
    @app = app
  end

  def call(env)
    uri = Rack::Request.new(env).path.gsub('/', '')
    if short_uri?(uri)
      pk_id = ShortUriGenerator.decode(uri)
      s_uri = ShortUri.find(pk_id_without_offset(pk_id))
      generate_response("#{s_uri.short_uri_protocol.name}://#{s_uri.user_url}")
    else
      @app.call(env)
    end
  end

  # check if uri path is short uri
  # because the short uri does not contain vowels we can detect it
  private
  def short_uri?(path)
    !(path =~ /[euioaEUIOA]/) && path.length >= ShortUri::SHORT_URI_MIN_LENGTH
  end

  def pk_offset
    @pk_offset ||= ShortUriGenerator.id_offset(ShortUri::SHORT_URI_MIN_LENGTH)
  end

  def pk_id_without_offset(pk_id)
    pk_id - pk_offset
  end

  def generate_response(location)
    [301, {'Location' => location}, []]
  end
end