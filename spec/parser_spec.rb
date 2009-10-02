require "#{File.dirname __FILE__}/spec_helper"

describe "Parser" do
  def self.spec_code code, _={}
    it code do
      ast = Carroll::Parser.new.parse code
      p ast if ENV['DEBUG']
      ast.should be_kind_of(Carroll::Node::AST)
    end
  end
  
  it_should_behave_like "Statements"
end
