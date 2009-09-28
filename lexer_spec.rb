require "spec_helper"

describe "lexer" do
  def self.spec_code(code)
    it code do
      code
    end
  end
  
  it_should_behave_like "value expressions"
  it_should_behave_like "statements"
end
