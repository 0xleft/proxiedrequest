require 'proxied_request'

RSpec.describe ProxiedRequest do
  it 'checks if proxy is working' do
    response = ProxiedRequest::HTTP.request('https://api.ipify.org')
    puts response.body
    expect(response.is_a?(Net::HTTPSuccess)).to eq(true)
  end

  it 'try making a config' do
      config = ProxiedRequest::Config.new
      config.timeout = 5
      config.set_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101 Firefox/60.0')
      config.set_header('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')

      expect(config.get_timeout).to eq(5)
      expect(config.get_headers['User-Agent']).to eq('Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101 Firefox/60.0')
      expect(config.get_headers['Accept']).to eq('text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')
  end

  it 'try making post request' do
      config = ProxiedRequest::Config.new
      config.type = MethodType::POST
      config.set_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101 Firefox/60.0')

      response = ProxiedRequest::HTTP.request('https://httpbin.org/post', config)
      puts response.body
      expect(response.is_a?(Net::HTTPSuccess)).to eq(true)
  end
end

