module Rulers
  class Router

    def controller_and_action(env)
      path = env['PATH_INFO']
      _, c, a, _ = path.split('/', 4)

      fail RoutingError.new(path) if c.empty?

      controller = c.capitalize + 'Controller'
      action = a.to_s.empty? ? 'index' : a

      [Object.const_get(controller), action]
    end

  end
end
