module Carroll::Node
  class AST
    def initialize(*nodes)
      @nodes = nodes
    end
    
    def <<(node)
      @nodes << node
      self
    end
    
    def eval(environment)
      raise 'noop'
    end
  end

  module Skip
    def self.eval(environment)
      raise 'noop'
    end
  end

  class Number
    def initialize(value)
      @value = value
    end
    
    def eval(environment)
      raise 'noop'
    end
  end

  class Literal
    def initialize(value)
      @value = value
    end
    
    def eval(environment)
      raise 'noop'
    end
  end

  class UnifyVariable
    def initialize(name, value)
      @name = name
      @value = value
    end

    def eval(environment)
      raise 'noop'
    end
  end
end