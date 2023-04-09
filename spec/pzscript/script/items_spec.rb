# frozen_string_literal: true

RSpec.describe Pzscript::Script::Items do
  let(:input) { "module Base {item Ruby {}}" }
  let(:parsed_input) { Pzscript::Parser.parse(input) }
  let(:items) { parsed_input.items }

  describe ".[]" do
    it "returns item by id" do
      expect(items["Ruby"]).to have_attributes(id: "Ruby")
    end

    context "when no item with id" do
      it "returns nil" do
        expect(items["NotRuby"]).to be_nil
      end
    end
  end
end
