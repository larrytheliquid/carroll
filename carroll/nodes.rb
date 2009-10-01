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
      @nodes.each {|node| node.eval(environment) }
      environment
    end
  end

  module Skip
    def self.eval(environment)
      # noop
    end
  end

  class Local
    def initialize(name, body)
      @name, @body = name, body
    end

    def eval(environment)
      p environment.merge(@name => Carroll::Runtime::Variable.new)
      @body.eval environment.merge(@name => Carroll::Runtime::Variable.new)
    end
  end

  class UnifyVariable
    def initialize(name, value)
      @name, @value = name, value
    end

    def eval(environment)
      environment[@name].bind @value.eval(environment)
    end
  end

  class Number
    def initialize(value)
      @value = value
    end
    
    def eval(environment)
      @value.to_i
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
end
