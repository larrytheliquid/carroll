module Carroll::Runtime
  class Variable
    def bind value
      @value = value
    end

    def dereference
      raise "#{inspect} unbound" unless defined? @value
      @value
    end
  end
end
