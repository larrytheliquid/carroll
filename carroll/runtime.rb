# TODO: need a real store

module Carroll::Runtime
  class Variable
    def initialize
      @equivalence_set = []
    end

    def bind value
      if defined?(@value) && @value != value
        raise "unification #{@value} != #{value}"
      end
      @value = value
    end

    def dereference
      raise "#{inspect} unbound" unless defined? @value
      @value
    end
  end
end
