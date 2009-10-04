module Carroll::Node
  class AST
    def initialize *nodes
      @nodes = nodes
    end

    def << node
      @nodes << node
      self
    end

    def eval environment
      @nodes.each {|node| node.eval environment }
      environment
    end
  end

  module Skip
    def self.eval environment
      # noop
    end
  end

  class Local
    def initialize name, body
      @name, @body = name, body
    end

    def eval environment
      @body.eval environment.merge(@name => Carroll::Runtime::Variable.new)
    end
  end

  class UnifyVariable
    def initialize name, target
      @name, @target = name, target
    end

    def eval environment
      environment.fetch(@name).unify environment.fetch(@target)
    end
  end

  class UnifyValue
    def initialize name, target
      @name, @target = name, target
    end

    def eval environment
      environment.fetch(@name).unify @target.to_value
    end
  end

  class Number
    def initialize value
      @value = value
    end

    def to_value
      Carroll::Runtime::Value::Number.new @value
    end
  end

  class Literal
    def initialize value
      @value = value
    end

    def to_value
      Carroll::Runtime::Value::Literal.new @value
    end
  end
end
