require 'socksify/http'
require 'net/http'
require_relative 'config.rb'

module ProxiedRequest
    class Error < StandardError; end

    class HTTP
        def self.proxy(server, port)
            TCPSocket.socks_server = server
            TCPSocket.socks_port = port
        end

        def self.get(url, config=Config.new)
            proxy(config.get_proxy, config.get_port)

            uri = URI.parse(url)

            if uri.host == nil
                raise ProxiedRequest::Error, "Invalid URL"
            end

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(uri)
            config.get_headers.each do |key, value|
                request.add_field(key, value)
            end

            http.open_timeout = config.get_timeout

            response = http.request(request)
            return response
        end
    end
end