require 'rubygems'
require 'lexr'

module Numbers
  module Scanner
    def self.scan(source)
      tokens = []
      expr = Lexr.that {
        ignores /\s+/     =>  :WHITESPACE
        matches /[-+]/    =>  :SIGN
        matches /[0-9]/   =>  :DIGIT
        matches /[a-fA-F0-9]+/ => :HEXDIGIT
        matches /\b[eE]\b/    =>  :E
        matches /\./      =>  :POINT
      }
      lexer = expr.new(source)
      until lexer.end?
        tokens << lexer.next
      end
      # wrap as [id, value] tokens for racc
      # trailing   end   token recast as   END   for racc
      tokens.map {|x| [x.type.upcase, x.value] }
    end
  end
end
