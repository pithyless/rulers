require 'core_ext/enumerable'

module Rulers
  class Application
    def call(env)
      `echo #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} >> log/debug.log`
      [
        200,
        {'Content-Type' => 'text/html'},
        ['Hello from your favorite framework!']
      ]
    end
  end
end
