class UrlHandler
  DEFAULT_PROTOCOL = 'http'

  def initialize(url)
    @url = url
  end

  def protocol
    @protocol ||= URI.parse(@url).scheme || DEFAULT_PROTOCOL
  rescue URI::InvalidURIError
    DEFAULT_PROTOCOL
  end

  def url_without_protocol
    @url_without_protocol ||= @url.gsub("#{protocol}://", '')
  end
end