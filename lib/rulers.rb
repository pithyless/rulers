require 'core_ext/enumerable'
require 'rulers/controller'
require 'rulers/router'

module Rulers
  RoutingError = Class.new(StandardError)
end

module Rulers
  class Application

    def call(env)
      `echo #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} >> log/debug.log`

      klass, action = Router.new.controller_and_action(env)
      controller = klass.new(env)
      html = controller.public_send(action)

      [
        200,
        {'Content-Type' => 'text/html'},
        [html]
      ]
    end

  end
end
