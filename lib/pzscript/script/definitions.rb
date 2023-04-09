# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents lines in item definition block in script file.
    class Definitions < Treetop::Runtime::SyntaxNode
      include Enumerable

      # Iterates over definitions.
      def each(&block)
        elements.each(&block)
      end

      # Converts to ruby Hash.
      # It converts each definition line name and values to respective ruby classes by calling #to_ruby.
      #
      # @example input
      #   DisplayName = Cool Hat
      #   Tags = Tag1;Tag2
      # @example result hash
      #   definitions.to_h => { "DisplayName" => "Cool Hat", "Tags" => ["Tag1", "Tag2"] }
      #
      # @return [::Hash<String,untyped>]
      def to_h
        each_with_object({}) do |property, hash|
          hash[property.name] = property.value
        end
      end
    end
  end
end
