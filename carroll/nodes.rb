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
      environment.fetch(@name).bind case @target
      when Number, Literal
        @target.value
      else
        environment.fetch(@target).dereference
      end
    end
  end

  class Number
    def initialize value
      @value = value
    end

    def value
      @value.to_i
    end
  end

  class Literal
    def initialize value
      @value = value
    end

    def value
      @value.to_sym
    end
  end
end
