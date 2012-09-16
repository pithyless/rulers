module Rulers
  class Controller

    def initialize(env)
      @env = env
    end

    attr_reader :env

    def controller_name
      name = self.class.to_s
      name.gsub!(/Controller$/, '')
      Inflector.underscore(name)
    end
  end
end
