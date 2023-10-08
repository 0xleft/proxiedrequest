# Proxied request

Make requests through tor.

## Installation

Run tor docker container:

```bash
./tor.sh
```

### OR

Locate your torrc (**Tor Browser\Browser\TorBrowser\Data\Tor**) file and add the following line:

```
SocksPort 127.0.0.1:9050
```

Install the gem:

```bash
gem install proxied_request
```

## Usage

1. Start tor

2. Make a request:

```ruby
require 'proxied_request'

# Make a request through tor
response = ProxiedRequest::HTTP.request('https://api.ipify.org')
puts response.body # =>

# Make a request through tor with a custom user agent
config = ProxiedRequest::Config.new
config.set_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101 Firefox/60.0')
config.type = MethodType::POST
config.body = 'foo=bar'
response = ProxiedRequest::HTTP.request('https://api.ipify.org', config)
puts response.body # =>