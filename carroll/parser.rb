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

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 41)
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
     1,    11,    18,     4,     5,    16,     6,     1,    10,    24,
     4,     5,     8,     6,     1,     7,    21,     4,     5,     1,
     6,    17,     4,     5,   nil,     6,     1,    22,   nil,     4,
     5,     1,     6,   nil,     4,     5,     1,     6,   nil,     4,
     5,     1,     6,   nil,     4,     5,   nil,     6,    12,    13,
    14 ]

racc_action_check = [
    23,     6,    11,    23,    23,     8,    23,    19,     5,    23,
    19,    19,     2,    19,     2,     1,    19,     2,     2,    20,
     2,    10,    20,    20,   nil,    20,    22,    20,   nil,    22,
    22,    18,    22,   nil,    18,    18,    17,    18,   nil,    17,
    17,     0,    17,   nil,     0,     0,   nil,     0,     7,     7,
     7 ]

racc_action_pointer = [
    39,     3,    12,   nil,   nil,     6,    -1,    46,     5,   nil,
    14,    -7,   nil,   nil,   nil,   nil,   nil,    34,    29,     5,
    17,   nil,    24,    -2,   nil ]

racc_action_default = [
   -10,   -10,   -10,    -1,    -3,   -10,   -10,   -10,   -10,    -2,
   -10,   -10,    -5,    -9,    -8,    -6,    25,   -10,   -10,   -10,
   -10,    -4,   -10,   -10,    -7 ]

racc_goto_table = [
     2,    15,     9,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    19,    20,     9,
     9,   nil,    23,     9 ]

racc_goto_check = [
     1,     3,     2,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     1,     1,     2,
     2,   nil,     1,     2 ]

racc_goto_pointer = [
   nil,     0,     0,    -6 ]

racc_goto_default = [
   nil,   nil,     3,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 14, :_reduce_1,
  2, 14, :_reduce_2,
  1, 15, :_reduce_3,
  5, 15, :_reduce_4,
  3, 15, :_reduce_5,
  3, 15, :_reduce_6,
  7, 15, :_reduce_7,
  1, 16, :_reduce_8,
  1, 16, :_reduce_9 ]

racc_reduce_n = 10

racc_shift_n = 25

racc_token_table = {
  false => 0,
  :error => 1,
  :IDENTIFIER => 2,
  :LITERAL => 3,
  :NUMBER => 4,
  :SKIP => 5,
  :LOCAL => 6,
  :IN => 7,
  :IF => 8,
  :THEN => 9,
  :ELSE => 10,
  :END => 11,
  "=" => 12 }

racc_nt_base = 13

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
  "IF",
  "THEN",
  "ELSE",
  "END",
  "\"=\"",
  "$start",
  "Statements",
  "Statement",
  "Value" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 17)
  def _reduce_1(val, _values, result)
     result = Node::AST.new val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 18)
  def _reduce_2(val, _values, result)
     result = val[0] << val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 22)
  def _reduce_3(val, _values, result)
     result = Node::Skip 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 23)
  def _reduce_4(val, _values, result)
     result = Node::Local.new val[1], val[3] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 24)
  def _reduce_5(val, _values, result)
     result = Node::UnifyVariable.new val[0], val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 25)
  def _reduce_6(val, _values, result)
     result = Node::UnifyValue.new val[0], val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 26)
  def _reduce_7(val, _values, result)
     result = Node::Conditional.new val[1], val[3], val[5] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 30)
  def _reduce_8(val, _values, result)
     result = Node::Number.new val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 31)
  def _reduce_9(val, _values, result)
     result = Node::Literal.new val[0] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Carroll
