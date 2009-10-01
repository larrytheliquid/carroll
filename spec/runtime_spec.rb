require "#{File.dirname(__FILE__)}/spec_helper"

describe "Runtime" do
  describe "Statements :: <statement>" do
    it "skip" do
      ast = Carroll::Parser.new.parse("skip")
      ast.eval({}).should == {}
    end
  end
end
