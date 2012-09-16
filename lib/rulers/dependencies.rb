class Object
  def self.const_missing(const)
    require Rulers::Inflector.underscore(const)

    # Delegate to Kernel::const_get to avoid infinite loop
    Kernel.const_get(const)
  end
end
