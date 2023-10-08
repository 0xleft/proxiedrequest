require 'socksify/http'
require 'net/http'
require_relative 'config.rb'
require_relative 'types.rb'

module ProxiedRequest
    class Error < StandardError; end

    class HTTP
        def self.proxy(server, port)
            TCPSocket.socks_server = server
            TCPSocket.socks_port = port
        end

        def self.request(url, config=Config.new)
            proxy(config.get_proxy, config.get_port)

            uri = URI.parse(url)

            if uri.host == nil
                raise ProxiedRequest::Error, "Invalid URL"
            end

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            case config.get_type
            when MethodType::GET
                request = Net::HTTP::Get.new(uri)
            when MethodType::POST
                request = Net::HTTP::Post.new(uri)
            when MethodType::PUT
                request = Net::HTTP::Put.new(uri)
            when MethodType::DELETE
                request = Net::HTTP::Delete.new(uri)
            when MethodType::HEAD
                request = Net::HTTP::Head.new(uri)
            when MethodType::OPTIONS
                request = Net::HTTP::Options.new(uri)
            when MethodType::TRACE
                request = Net::HTTP::Trace.new(uri)
            when MethodType::PATCH
                request = Net::HTTP::Patch.new(uri)
            else
                raise ProxiedRequest::Error, "Invalid request type"
            end

            config.get_headers.each do |key, value|
                request.delete(key)
                request.add_field(key, value)
            end

            request.body = config.get_body

            http.open_timeout = config.get_timeout

            response = http.request(request)
            return response
        end
    end
end