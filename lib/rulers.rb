require 'rulers/inflector'

require 'core_ext/string'
require 'core_ext/enumerable'

require 'rulers/controller'
require 'rulers/router'

module Rulers
  RoutingError = Class.new(StandardError)
end

module Rulers
  class Application

    def call(env)
      log_request(env)

      return not_found if asset?(env)

      klass, action = Router.new.controller_and_action(env)
      controller = klass.new(env)
      html = controller.public_send(action)

      [
        200,
        {'Content-Type' => 'text/html'},
        [html]
      ]
    end

    private

    def log_request(env)
      `echo #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} >> log/debug.log`
    end

    def not_found
      [404, {'Content-Type' => 'text/html'}, []]
    end

    def asset?(env)
      env['PATH_INFO'] == '/favicon.ico'
    end
  end
end
