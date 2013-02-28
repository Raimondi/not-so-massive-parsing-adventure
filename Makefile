all: lib/suckland/parser.rb lib/numbers/parser.rb

lib/suckland/parser.rb: lib/suckland/parser.racc
	racc -o lib/suckland/parser.rb lib/suckland/parser.racc

lib/numbers/parser.rb: lib/numbers/parser.racc
	racc -v -o lib/numbers/parser.rb lib/numbers/parser.racc

