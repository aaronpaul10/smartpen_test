RSpec.describe LogParser::Reader do
  let(:reader) { described_class.new(path) }
  let(:path) { File.expand_path("../fixtures/test.log", __FILE__) }

  describe "class method #lines" do
    subject(:lines) { reader.file_lines.to_a }

    let(:expected_output) { ["/home 1.1.1.1", "/contact 2.2.2.2", "/about 3.3.3.3"] }

    it { is_expected.to eql(expected_output) }

    context "with invalid or non-existent file" do
      let(:path) { "some/file.log" }

      it "raises an error" do
        expect { lines }.to raise_error(LogParser::Error)
      end
    end
  end
end
