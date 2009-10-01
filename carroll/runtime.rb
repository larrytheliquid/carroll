module Carroll::Runtime
  class Variable
    def bind(value)
      @value = value
    end

    def value
      raise "#{self.inspect} unbound" unless defined?(@value)
      @value
    end
  end
end
