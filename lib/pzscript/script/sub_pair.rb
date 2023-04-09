# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents value of hash when it is divided by '|' in script file.
    class SubPair < Treetop::Runtime::SyntaxNode
      # It returns pair of values.
      #
      # @example input
      #   EvolvedRecipe = Soup:5|Cooked
      # @example result
      #   sub_pair.to_ruby => [5, 'Cooked']
      #
      # @return [Array<untyped>]
      def to_ruby
        [value1.to_ruby, value2.to_ruby]
      end
    end
  end
end
