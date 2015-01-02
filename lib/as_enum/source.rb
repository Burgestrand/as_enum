require "as_enum/version"

module AsEnum
  module_function

  def as_enum(target = self, method)
    trace = caller_locations(1, 1)[0]

    target.prepend Module.new {
      class_eval <<-CODE.gsub("\n", ";"), trace.path, trace.lineno
        def #{method}(*args)
          if block_given?
            super
          else
            to_enum(__method__, *args)
          end
        end
      CODE
    }
  end
end
