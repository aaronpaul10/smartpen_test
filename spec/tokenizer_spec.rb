RSpec.describe LogParser::Tokenizer do
  let(:tokenizer) { described_class.new(arr_lines) }
  let(:arr_lines) {
    [
      "/home 1.1.1.1",
      "/contact 2.2.2.2",
      "/about 3.3.3.3",
    ]
  }

  describe "class method #entries" do
    subject { tokenizer.create_entries.to_a }

    let(:expected_output) {
      [
        LogParser::Entry.new("/home", "1.1.1.1"),
        LogParser::Entry.new("/contact", "2.2.2.2"),
        LogParser::Entry.new("/about", "3.3.3.3"),
      ]
    }

    it { is_expected.to eql(expected_output) }
  end
end
