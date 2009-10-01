require "#{File.dirname(__FILE__)}/spec_helper"

describe "Runtime" do
  describe "Statements :: <statement>" do
    it "skip" do
      ast = Carroll::Parser.new.parse("skip")
      ast.eval({}).should == {}
    end

    it "local Ignore in skip end" do
      ast = Carroll::Parser.new.parse("local Ignore in skip end")
      ast.eval({}).should == {}
    end

    it "Result = 42" do
      ast = Carroll::Parser.new.parse("Result = 42")
      scope = {"Result" => Carroll::Runtime::Variable.new}
      ast.eval(scope)["Result"].value.should == 42
    end

    it "local LarryTheLiquid in LarryTheLiquid = 1337 end" do
      ast = Carroll::Parser.new.parse("local LarryTheLiquid in LarryTheLiquid = 1337 end")
      ast.eval({}).should == {}
    end

    # next test & implement ident = ident, and better spec_ , syntax
  end
end
