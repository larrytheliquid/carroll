require "#{File.dirname(__FILE__)}/spec_helper"

describe "Runtime" do
  def self.spec_code code, expected_bindings={}
    it code do
      ast = Carroll::Parser.new.parse code

      environment = Hash[*expected_bindings.map do |identifier, _|
        [identifier, Carroll::Runtime::Variable.new]
      end.flatten]

      Hash[*ast.eval(environment).map do |identifier, variable|
        [identifier, variable.dereference]
      end.flatten].should == expected_bindings
    end
  end

  it_should_behave_like "Statements"
end
