class Carroll::Parser

# Abstract machine
token IDENTIFIER

# Value expressions
token LITERAL
token NUMBER

# Statements
token SKIP

rule
  Statements:
    Statement                          { result = Node::AST.new val[0] }
  | Statements Statement               { result = val[0] << val[1] }
  ;

  Statement:
    SKIP                               { result = Node::Skip }
  | IDENTIFIER '=' Value               { result = Node::UnifyVariable.new val[0], val[2] }
  ;
  
  Value:
    NUMBER                        { result = Node::Number.new val[0] }
  | IDENTIFIER                    { result = Node::Literal.new val[0] }
  ;
end

---- header
  require "#{File.dirname(__FILE__)}/lexer"
  require "#{File.dirname(__FILE__)}/nodes"

---- inner
  def parse(code)
    @tokens = Carroll::Lexer.new.tokenize(code)
    do_parse
  end
  
  def next_token
    @tokens.shift
  end
