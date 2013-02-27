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
        matches /[aA]/    =>  :A
        matches /[bB]/    =>  :B
        matches /[cC]/    =>  :C
        matches /[dD]/    =>  :D
        matches /[eE]/    =>  :E
        matches /[fF]/    =>  :F
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
