module Carroll::Runtime
  Entity = Class.new

  class Variable < Entity
    @@store = []
    def initialize
      @reference = self
      @@store << self
    end

    def unify entity
      raise "Not unifying an Entity: #{entity.inspect}" unless entity.is_a? Entity
      @@store.each do |variable|
        if variable.references? self
          variable.send :_reference=, if entity.is_a? Value
            entity
          else
            entity.send :_reference
          end
        end
      end
      entity
    end

    def value
      raise "Variable unbound: #{inspect}" if @reference.is_a? Variable
      @reference
    end

    def references?(entity) @reference.equal? entity end

  private

    def _reference() @reference end
    def _reference=(entity) @reference = entity end
  end

  class Value < Entity
    def initialize(value) @value = value end
    def value() self end
    def _value() @value end
    def print() @value.to_s end

    def ==(other)
      @value == other._value
    end

    class Number < Value
      def initialize value
        super value.to_i
      end
    end

    class Procedure < Value
      def initialize environment, arg, body
        @environment, @arg, @body = environment, arg, body
        super self
      end
    end

    class Literal < Value
      def initialize value
        super value.to_sym
      end
    end
  end
end
