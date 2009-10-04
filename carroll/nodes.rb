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
      environment.fetch(@name).unify @target.eval(environment)
    end
  end

  class Conditional
    def initialize condition, if_body, else_body
      @condition, @if_body, @else_body = condition, if_body, else_body
    end

    def eval environment
      condition_value = environment.fetch(@condition).value
      if condition_value == Carroll::Runtime::Value::Literal.new("true")
        @if_body.eval environment
      elsif condition_value == Carroll::Runtime::Value::Literal.new("false")
        @else_body.eval environment
      else
        raise %{Conditionals must branch on "true" or "false"}
      end
    end
  end

  class Number
    def initialize value
      @value = value
    end

    def eval _
      Carroll::Runtime::Value::Number.new @value
    end
  end

  class Procedure
    def initialize arg, body
      @arg, @body = arg, body
    end

    def eval environment
      Carroll::Runtime::Value::Procedure.new environment.dup, @arg, @body
    end
  end

  class Literal
    def initialize value
      @value = value
    end

    def eval _
      Carroll::Runtime::Value::Literal.new @value
    end
  end
end
