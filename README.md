# Proxied request

Make requests through tor.

## Installation

Locate your torrc (**Tor Browser\Browser\TorBrowser\Data\Tor**) file and add the following line:

```
SocksPort 127.0.0.1:9050
```

## Usage

1. Start tor

```ruby
require 'proxied_request'

# Make a request through tor
response = ProxiedRequest::HTTP.request('https://api.ipify.org')
puts response.body # =>

# Make a request through tor with a custom user agent
config = ProxiedRequest::Config.new
config.set_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101 Firefox/60.0')
config.type = MethodType::POST
response = ProxiedRequest::HTTP.request('https://api.ipify.org', config)
puts response.body # =>