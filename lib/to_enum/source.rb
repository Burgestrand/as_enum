require "to_enum/version"

module ToEnum
  module_function

  def to_enum(target = self, method)
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
