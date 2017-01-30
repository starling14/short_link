class UrlHandler
  DEFAULT_PROTOCOL = 'http'

  def initialize(url)
    @url = url
  end

  # returns url protocol. if protocol is absent returns default protocol
  def protocol
    @protocol ||= URI.parse(@url).scheme || DEFAULT_PROTOCOL
  rescue URI::InvalidURIError
    DEFAULT_PROTOCOL
  end

  # returns url without protocol
  def url_without_protocol
    @url_without_protocol ||= @url.gsub("#{protocol}://", '')
  end
end