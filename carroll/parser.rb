#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require "#{File.dirname __FILE__}/lexer"
  require "#{File.dirname __FILE__}/nodes"

module Carroll
  class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 38)
  def parse code
    @tokens = Carroll::Lexer.new.tokenize code
    do_parse
  end

  def next_token
    @tokens.shift
  end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     3,    15,     9,     4,     5,     6,    17,     3,     8,     3,
     4,     5,     4,     5,     3,    10,   nil,     4,     5,    12,
    13,    14 ]

racc_action_check = [
    16,     9,     5,    16,    16,     1,    16,     1,     3,    15,
     1,     1,    15,    15,     0,     6,   nil,     0,     0,     8,
     8,     8 ]

racc_action_pointer = [
    12,     5,   nil,    -1,   nil,     0,    15,   nil,    17,    -6,
   nil,   nil,   nil,   nil,   nil,     7,    -2,   nil ]

racc_action_default = [
    -9,    -9,    -1,    -9,    -3,    -9,    -9,    -2,    -9,    -9,
    18,    -6,    -5,    -8,    -7,    -9,    -9,    -4 ]

racc_goto_table = [
     1,     7,    11,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    16,     7 ]

racc_goto_check = [
     1,     2,     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     1,     2 ]

racc_goto_pointer = [
   nil,     0,     0,    -6 ]

racc_goto_default = [
   nil,   nil,     2,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 11, :_reduce_1,
  2, 11, :_reduce_2,
  1, 12, :_reduce_3,
  5, 12, :_reduce_4,
  3, 12, :_reduce_5,
  3, 12, :_reduce_6,
  1, 13, :_reduce_7,
  1, 13, :_reduce_8 ]

racc_reduce_n = 9

racc_shift_n = 18

racc_token_table = {
  false => 0,
  :error => 1,
  :IDENTIFIER => 2,
  :LITERAL => 3,
  :NUMBER => 4,
  :SKIP => 5,
  :LOCAL => 6,
  :IN => 7,
  :END => 8,
  "=" => 9 }

racc_nt_base = 10

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "IDENTIFIER",
  "LITERAL",
  "NUMBER",
  "SKIP",
  "LOCAL",
  "IN",
  "END",
  "\"=\"",
  "$start",
  "Statements",
  "Statement",
  "Value" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 15)
  def _reduce_1(val, _values, result)
     result = Node::AST.new val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 16)
  def _reduce_2(val, _values, result)
     result = val[0] << val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 20)
  def _reduce_3(val, _values, result)
     result = Node::Skip 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 21)
  def _reduce_4(val, _values, result)
     result = Node::Local.new val[1], val[3] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 22)
  def _reduce_5(val, _values, result)
     result = Node::UnifyVariable.new val[0], val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 23)
  def _reduce_6(val, _values, result)
     result = Node::UnifyValue.new val[0], val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 27)
  def _reduce_7(val, _values, result)
     result = Node::Number.new val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 28)
  def _reduce_8(val, _values, result)
     result = Node::Literal.new val[0] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Carroll
