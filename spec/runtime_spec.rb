require "#{File.dirname __FILE__}/spec_helper"

describe "Runtime" do
  def self.spec_code code, *expected_bindings
    error, identifiers, expectations = false, [], ""
    if expected_bindings.first == :error
      expected_bindings.shift
      error, identifiers, expectations = true, expected_bindings, "<Error>"
    else
      expected_bindings = expected_bindings.first
      expected_bindings ||= {}
      identifiers, expectations = expected_bindings.keys, expected_bindings.inspect
    end

    it "(#{code}, #{expectations})" do
      ast = Carroll::Parser.new.parse code

      environment = Hash[*identifiers.map do |identifier|
        [identifier, Carroll::Runtime::Variable.new]
      end.flatten]

      if error
        lambda { ast.eval(environment) }.should raise_error
      else
        Hash[*ast.eval(environment).map do |identifier, variable|
          [identifier, variable.dereference.print]
        end.flatten].should == expected_bindings
      end
    end
  end

  it_should_behave_like "Statements"
end
