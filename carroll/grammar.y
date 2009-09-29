class Parser

# Abstract machine
token IDENTIFIER

# Value expressions
token LITERAL
token NUMBER

# Statements
token SKIP

rule
  Root:
    Statements                         { result = Node::AST.new val[0] }
  ;

  Statement:
    SKIP                               { result = Node::Skip }
  | Statements Statement               { result = val[0] << val[1] }
  | IDENTIFIER '=' Value               { result = Node::UnifyVariable.new val[0], val[2] }
  ;
  
  Value:
    NUMBER                        { result = LiteralNode.new(val[0]) }
  | TRUE                          { result = LiteralNode.new(true) }
  | FALSE                         { result = LiteralNode.new(false) }
  ;
end

---- header
  require "lexer"
  require "nodes"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Carroll::Lexer.new.tokenize(code)
    p @tokens if show_tokens
    do_parse
  end
  
  def next_token
    @tokens.shift
  end
