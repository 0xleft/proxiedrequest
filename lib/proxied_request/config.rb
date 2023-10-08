module ProxiedRequest
    class Error < StandardError; end

    class Config
        def initialize
            @proxy = "127.0.0.1"
            @port = 9050

            @headers = {}

            @timeout = 10
        end

        def proxy=(proxy)
            @proxy = proxy
        end

        def port=(port)
            @port = port
        end

        def set_header(key, value)
            @headers[key] = value
        end

        def timeout=(timeout)
            @timeout = timeout
        end

        def get_proxy
            @proxy
        end

        def get_port
            @port
        end

        def get_headers
            @headers
        end

        def get_timeout
            @timeout
        end
    end
end