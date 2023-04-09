# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents arrays in script file.
    # Any string that contains ';' and not ':' in it will be parsed as Pzscript::Script::Array
    #
    # @example
    #   Tags = RiceRecipe;HasMetal,
    class Array < Treetop::Runtime::SyntaxNode
      include Enumerable

      def each
        return to_enum(:each) unless block_given?

        yield head

        tail.elements.each { |element| yield element.value }
      end

      # Converts node to ruby array
      #
      # @return [::Array]
      def to_ruby
        map(&:to_ruby)
      end
    end
  end
end
