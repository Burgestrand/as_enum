require "as_enum/version"

module AsEnum
  module_function

  def as_enum(target = self, method)
    target.prepend Module.new {
      class_eval <<-CODE, __FILE__, __LINE__
        def #{method}(*args)
          if block_given?
            super
          else
            to_enum(:#{method}, *args)
          end
        end
      CODE
    }
  end
end
