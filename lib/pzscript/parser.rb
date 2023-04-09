# frozen_string_literal: true

require "treetop"

require_relative "script/array"
require_relative "script/definition"
require_relative "script/definitions"
require_relative "script/false"
require_relative "script/float"
require_relative "script/hash"
require_relative "script/identifier"
require_relative "script/integer"
require_relative "script/item"
require_relative "script/items"
require_relative "script/module"
require_relative "script/module_block"
require_relative "script/sub_pair"
require_relative "script/true"
require_relative "parser/version"
require_relative "script/word"

module Pzscript
  # This is Project Zomboid media/scripts files parser.
  module Parser
    class ParseError < StandardError; end

    def self.parse(data)
      parser = Pzscript::ScriptParser.new
      result = parser.parse(data.gsub(%r{/\*.*?\*/}m, ""))

      raise ParseError, "Parse error: #{parser.failure_reason}" if result.nil?

      result
    end
  end
end

Treetop.load(File.expand_path(File.join(File.dirname(__FILE__), "pzscript")))
