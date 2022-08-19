RSpec.describe LogParser::Parser do
  let(:parser) { described_class.new("file/directory") }

  describe "class method #format" do
    subject { parser.format }

    let(:reader) {
      instance_double(LogParser::Reader, file_lines: ["/home 1.1.1.1", "/contant 2.2.2.2", "/about 3.3.3.3"])
    }

    before do
      allow(LogParser::Reader).to receive(:new).with("file/directory").and_return(reader)
    end

    it { is_expected.to include("Page paths ordered by total hits:") }
  end
end
