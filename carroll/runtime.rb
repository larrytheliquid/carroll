module Carroll::Runtime
  Entity = Class.new

  class Variable < Entity
    @@store = []
    attr_accessor :reference
    def initialize
      @reference = self
      @@store << self
    end

    def unify entity
      raise "Not unifying an Entity: #{entity.inspect}" unless entity.is_a? Entity
      @@store.each do |variable|
        if variable.references? self
          variable.reference = if entity.is_a? Value
            entity
          else
            entity.reference
          end
        end
      end
      entity
    end

    def dereference
      raise "Variable unbound: #{inspect}" if @reference.is_a? Variable
      @reference
    end

    def references?(entity) @reference.equal? entity end
  end

  # TODO: Cache literals as they are immutable
  class Value < Entity
    def initialize(value) @value = value end
    def value() @value end
    def print() @value.to_s end

    def ==(other)
      @value == other.value
    end

    class Number < Value
      def initialize value
        super value.to_i
      end
    end

    class Procedure < Value
      def initialize environment, params, body
        @environment, @params, @body = environment, params, body
        super self
      end

      def apply args
        raise "Arity mismatch #{@params.size} != #{args.size}" if @params.size != args.size
        @params.each_with_index do |param, i|
          @environment[param] = args[i]
        end
        @body.eval @environment
      end
    end

    class Literal < Value
      def initialize value
        super value.to_sym
      end
    end
  end
end
