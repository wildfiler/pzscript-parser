# frozen_string_literal: true

RSpec.describe Pzscript::Parser do
  it "has a version number" do
    expect(Pzscript::Parser::VERSION).not_to be_nil
  end

  describe ".parse" do
    it "parses module definition" do
      input = "module Base {}"

      result = described_class.parse(input)

      expect(result).to be_a(Pzscript::Script::Module)
      expect(result.id).to eq "Base"
    end

    it "parses item definition" do
      input = "item Ruby {}"

      result = described_class.parse(input)

      expect(result).to be_a(Pzscript::Script::Item)
      expect(result.id).to eq "Ruby"
    end

    it "parses items in module" do
      input = <<~SCRIPT
        module Base {
          item Ruby {
            isShiny = true,
          }
        }
      SCRIPT

      result = described_class.parse(input)

      expect(result.items).to contain_exactly(have_attributes(id: "Ruby", full_id: "Base.Ruby"))
    end

    it "parses arrays" do
      input = "tag1;tag2;tag with spaces"

      result = described_class.parse(input)

      expect(result).to be_a(Pzscript::Script::Array)
      expect(result.to_ruby).to eq(["tag1", "tag2", "tag with spaces"])
    end

    it "parses hashes" do
      input = "Shiny:150|Sparkling;Redness:100"

      result = described_class.parse(input)

      expect(result).to be_a(Pzscript::Script::Hash)
      expect(result.to_ruby).to match("Shiny" => [150, "Sparkling"], "Redness" => 100)
    end

    it "converts booleans" do
      input = "TRUE;true;FALSE;false"

      result = described_class.parse(input)

      expect(result.to_ruby).to eq([true, true, false, false])
    end

    it "converts numbers" do
      input = "100;100.5"

      int_result, float_result = described_class.parse(input).to_ruby

      expect(int_result).to be_a(Integer).and eq(100)
      expect(float_result).to be_a(Float).and eq(100.5)
    end

    context "when string starts with digit" do
      it "parses it correctly" do
        input = "1tag;2tag long"

        result = described_class.parse(input)

        expect(result.to_ruby).to eq(["1tag", "2tag long"])
      end
    end
  end
end
