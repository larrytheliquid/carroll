class Carroll::Parser

# Abstract machine
token IDENTIFIER

# Value expressions
token LITERAL
token NUMBER

# Statements
token SKIP
token LOCAL IN
token IF THEN ELSE
token PROC
token END

rule
  Statements:
    Statement                                         { result = Node::AST.new val[0] }
  | Statements Statement                              { result = val[0] << val[1] }
  ;

  Identifiers:
    IDENTIFIER                                        { result = Array.[] val[0] }
  | Identifiers IDENTIFIER                            { result = val[0] << val[1] }
  ;

  Statement:
    SKIP                                              { result = Node::Skip }
  | LOCAL IDENTIFIER IN Statements END                { result = Node::Local.new val[1], val[3] }
  | IDENTIFIER '=' IDENTIFIER                         { result = Node::UnifyVariable.new val[0], val[2] }
  | IDENTIFIER '=' Value                              { result = Node::UnifyValue.new val[0], val[2] }
  | IF IDENTIFIER THEN Statements ELSE Statements END { result = Node::Conditional.new val[1], val[3], val[5] }
  | '{' IDENTIFIER Identifiers '}'                    { result = Node::Application.new val[1], val[2] }
  ;

  Value:
    NUMBER                                            { result = Node::Number.new val[0] }
  | PROC '{' '$' Identifiers '}' Statements END       { result = Node::Procedure.new val[3], val[5] }
  | Record                                            { result = val[0] }
  ;

  Record:
    LITERAL                                           { result = Node::Literal.new val[0] }
  | LITERAL '(' Feature ':' IDENTIFIER ')'            { result = Node::Literal.new val[0], val[2], val[4] }
  ;

  Feature:
    NUMBER                                            { result = Node::Number.new val[0] }
  | LITERAL                                           { result = Node::Literal.new val[0] }
  ;
end

---- header
  require "#{File.dirname __FILE__}/lexer"
  require "#{File.dirname __FILE__}/nodes"

---- inner
  def parse code
    @tokens = Carroll::Lexer.new.tokenize code
    do_parse
  end

  def next_token
    @tokens.shift
  end
