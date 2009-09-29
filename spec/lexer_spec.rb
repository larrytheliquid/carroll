require "#{File.dirname(__FILE__)}/spec_helper"

describe "Lexer" do
  def self.spec_code(code)
    it code do
      tokens = Carroll::Lexer.new.tokenize(code)
      p tokens if ENV['DEBUG']
      tokens.should be_kind_of(Array)
      tokens.should_not be_empty
    end
  end
  
  it_should_behave_like "Value expressions"
  it_should_behave_like "Statements"
end
