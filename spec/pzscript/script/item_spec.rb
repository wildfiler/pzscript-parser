# frozen_string_literal: true

RSpec.describe Pzscript::Script::Item do
  let(:input) { "module Base { item Ruby {isShiny = true,} }" }
  let(:parsed_input) { Pzscript::Parser.parse(input) }
  let(:item) { parsed_input.items.first }

  describe "#id" do
    it "returns id of item" do
      expect(item.id).to eq "Ruby"
    end
  end

  describe "#full_id" do
    it "returns id of item with module id" do
      expect(item.full_id).to eq "Base.Ruby"
    end
  end

  describe "#raw_source" do
    it "returns input of item definition" do
      expect(item.raw_source).to eq "item Ruby {isShiny = true,}"
    end
  end

  describe "#properties" do
    it "returns hash with parsed properties of item" do
      expect(item.properties).to match("isShiny" => true)
    end
  end
end
