module Carroll
  class Node::AST
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

  module Node::Skip
    def self.eval(environment)
      raise 'noop'
    end
  end

  class Node::Literal
    def initialize(value)
      @value = value
    end
    
    def eval(environment)
      raise 'noop'
    end
  end

  class Node::UnifyVariable
    def initialize(name, value)
      @name = name
      @value = value
    end

    def eval(environment)
      raise 'noop'
    end
  end
end
