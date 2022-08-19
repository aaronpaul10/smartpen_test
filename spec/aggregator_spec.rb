RSpec.describe LogParser::Aggregator do
  let(:aggregator) { described_class.new(entries) }
  let(:entries) {
    [
      LogParser::Entry.new("/home", "1.1.1.1"),
      LogParser::Entry.new("/contact", "2.2.2.2"),
      LogParser::Entry.new("/about", "3.3.3.3"),
      LogParser::Entry.new("/home", "3.3.3.3"),
    ]
  }

  describe "class method #group" do
    subject(:group) { aggregator.group_data }
    it "group entries by their path" do
      expect(group.keys).to match_array(["/home", "/contact", "/about"])
    end

    it "stores total views" do
      expect(group.fetch("/home").total).to eql(2)
    end
  end
end
