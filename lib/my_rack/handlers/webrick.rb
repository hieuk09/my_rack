require_relative '../handlers'
require 'webrick'

module MyRack
  class Handlers
    class WEBrick < ::WEBrick::HTTPServlet::AbstractServlet
      def initialize(server, app)
        super(server)

        @app = app
      end

      def service(request, response)
        env = request.meta_vars
        env['rack.input'] = request.body
        env['rack.errors'] = $stderr
        status, headers, body = @app.call(env)

        response.status = status

        headers.each do |key, value|
          response[key] = value
        end

        response.body = body.join
      end

      def self.run(app)
        server = ::WEBrick::HTTPServer.new(Port: 9292)
        server.mount '/', self, app
        server.start
      end
    end

    register :webrick, WEBrick
  end
end
