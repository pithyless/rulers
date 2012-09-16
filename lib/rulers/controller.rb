module Rulers
  class Controller

    def initialize(env)
      @env = env
    end

    attr_reader :env

    def render(view_name, locals={})
      filename = File.join('app', 'views', controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: env))
    end

    def controller_name
      name = self.class.to_s
      name.gsub!(/Controller$/, '')
      Inflector.underscore(name)
    end
  end
end
