class Carroll::Lexer
  KEYWORDS = %w[skip local in end]
  
  def tokenize code
    code.strip!
    code_size = code.size
    i , tokens = 0, []

    while i < code_size
      chunk = code[i..-1]

      if identifier = chunk[/\A([A-Z]\w*)/, 1]
        tokens << [:IDENTIFIER, identifier]
        i += identifier.size

      elsif literal = chunk[/\A[a-z]\w*/]
        tokens << if KEYWORDS.include?(literal)
          [literal.upcase.to_sym, literal]
        else
          [:LITERAL, literal]
        end
        i += literal.size
        
      elsif number = chunk[/\A([0-9]+)/, 1]
        tokens << [:NUMBER, number.to_i]
        i += number.size

      elsif space = chunk[/\A(\s+)/, 1]
        i += space.size

      else token = chunk[0,1]
        tokens << [token, token]
        i += 1
      end
    end

    tokens
  end
end
