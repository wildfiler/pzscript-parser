# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents hashes in script file.
    # Any string that contains ';' and ':' in it will be parsed as Pzscript::Script::Hash
    #
    # If value after ':' contains '|' it will be returned as {Pzscript::Script::SubPair}
    # @example
    #   EvolvedRecipe = Stir fry Griddle Pan:7;Stir fry:7|Cooked
    class Hash < Treetop::Runtime::SyntaxNode
      include Enumerable

      # Calls <i>block</i> once for each key, passing the key-value
      # pair as parameters.
      #
      # If no block is given, an enumerator is returned instead.
      def each(&block)
        return to_enum(:each) unless block_given?

        {}.each
        if block.arity == 2
          each_element(&block)
        else
          each_element { |key, value| yield [key, value] }
        end
      end

      # Converts to ruby Hash.
      # It converts keys and values to respective ruby classes by calling #to_ruby.
      #
      # @return [Hash]
      def to_h
        each_with_object({}) do |(key, value), hash|
          hash[key.to_ruby] = value.to_ruby
        end
      end
      alias to_ruby to_h

      private

      def each_element
        yield head.key, head.value

        tail.elements.each do |element|
          yield element.pair.key, element.pair.value
        end
      end
    end
  end
end
