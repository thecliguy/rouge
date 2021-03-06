# -*- coding: utf-8 -*- #

module Support
  module Guessing
    def assert_guess(type=nil, info={})
      if type.is_a? Hash
        info = type
        type = nil
      end

      type ||= subject.class

      assert { Rouge::Lexer.guess(info) == type }
      Rouge::Lexer.all.reverse!

      assert { Rouge::Lexer.guess(info) == type }
      Rouge::Lexer.all.reverse!
    end

    def deny_guess(type=nil, info={})
      if type.is_a? Hash
        info = type
        type = nil
      end

      type ||= subject.class

      deny { Rouge::Lexer.guess(info) == type }
      Rouge::Lexer.all.reverse!

      deny { Rouge::Lexer.guess(info) == type }
      Rouge::Lexer.all.reverse!
    end
  end
end
