#!/usr/bin/env ruby

require 'test/unit'
require './lib/numbers/scanner'
require './lib/numbers/parser'

class TestNumbers < Test::Unit::TestCase
    def test_numbers
        testNumbers =
            [
                "-0", "+0",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                "0123456789",
                "123", "-123",
                "0.0", "0.01",
                "-0.0", "+0.0",
                "123.0", "123.01", "-123.0", "-123.01",
                "-123e+12", "-123e-12", "+123e+12", "+123e-12", "-123E+12", "-123E-12", "+123E+12", "+123E-12",
                "123.456e+00", "123.456E+00", "123.456e-00", "123.456E-00",
                "-123.456e+00", "-123.456E+00", "-123.456e-00", "-123.456E-00",
                "+123.456e+00", "+123.456E+00", "+123.456e-00", "+123.456E-00",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                "A", "B", "C", "D", "E", "F",
                "a", "b", "c", "d", "e", "f",
                "0123456789ABCDEF",
                "0123456789abcdef",
                "DEADBEEF", "0123BEEF", "DEAD0123",
                "deadbeef", "0123beef", "dead0123",
                "123E", "123e"
        ]
        testNumbers.each do |x|
            tokens = Numbers::Scanner.scan(x)
            result = Numbers::Parser.new.parse(tokens)
            assert_not_nil result, x
        end
    end
end
