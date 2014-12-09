class TabloService
  [
      {name: 'in_yesterday', day: 0, operation: 1},
      {name: 'in_today',     day: 1, operation: 1},
      {name: 'in_tomorrow',  day: 2, operation: 1},

      {name: 'out_yesterday', day: 0, operation: 0},
      {name: 'out_today',     day: 1, operation: 0},
      {name: 'out_tomorrow',  day: 2, operation: 0}
  ].each do |method|
    define_method "get_#{method[:name]}" do
      request Global.tablo.url % [method[:day], method[:operation]]
    end
  end

  private

  def request(url)
    info = {}
    # resp = Net::HTTP.get_response(URI.parse(url))

    uri                     = URI(url)
    req                     = Net::HTTP::Get.new(uri.request_uri)
    req['Referer']          = 'http://www.airportufa.ru/'
    req['User-Agent']       = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36'
    req['X-Requested-With'] = 'XMLHttpRequest'

    resp = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(req) }

    info = JSON.parse(resp.body) if resp
    info
  rescue => e
    Rails.logger.debug e
    {}
  end
end