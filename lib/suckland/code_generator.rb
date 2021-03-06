module Suckland
  module CodeGenerator
    class C
      def compile(ast)
        @output = <<-EOF
int
main (void)
{
EOF
        case ast.first
        when :script
          compile_call(ast[1])
        else
          error ":("
        end

        @output += <<-EOF
  return 0
}
EOF
      end

      def compile_call(call)
        case call.first
        when :call
          @output += "  #{call[1]}();\n"
        else
          error ":("
        end
      end
    end
  end
end
