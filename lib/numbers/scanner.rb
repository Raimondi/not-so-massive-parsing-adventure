require 'rubygems'
require 'lexr'

module Numbers
  module Scanner
    def self.scan(source)
      tokens = []

      #while !source.empty?
      #  case source
      #  when /\A[a-zA-Z_][a-zA-Z0-9_]*/
      #    tokens << [:ID, $&]
      #    source.slice!(0, $&.size)
      #  when /\A[\(\)]/
      #    tokens << [$&, $&]
      #    source[0] = ''
      #  when /\A\s+/
      #    source.slice!(0, $&.size)
      #  else
      #    STDERR.puts "unknown input at '#{source[0...10]}...'"
      #    exit 1
      #  end
      #end
      expr = Lexr.that {
        ignores /\s+/ => :whitespace
        matches /[-+]/ => :sign
        matches /[eE]/ => :exp
        matches /[0-9]+/ => :unsigned
        matches /\./ => :point

      }
      lexer = expr.new(source)
      until lexer.end?
        tokens << lexer.next
      end

      tokens.map! do |x|
        [x.type, x.value]
      end
      tokens[0..-2]
    end
  end
end


