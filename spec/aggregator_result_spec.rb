RSpec.describe LogParser::AggregatorResult do
  let(:result) { described_class[grouped_entries] }
  let(:grouped_entries) {
    {
      "/about" => accumulator1,
      "/contact" => accumulator2,
      "/home" => accumulator3,
    }
  }

  let(:accumulator1) { instance_double(LogParser::Accumulator, unique: 42, total: 50) }
  let(:accumulator2) { instance_double(LogParser::Accumulator, unique: 32, total: 100) }
  let(:accumulator3) { instance_double(LogParser::Accumulator, unique: 193, total: 243) }

  describe "class method #sort_by_total_views" do
    subject { result.sort_by_total_views }

    let(:expected_output) {
      [
        ["/home", accumulator3],
        ["/contact", accumulator2],
        ["/about", accumulator1],
      ]
    }

    it { is_expected.to eql(expected_output) }
  end

  describe "class method #sort_by_unique_views" do
    subject { result.sort_by_unique_views }

    let(:expected_output) {
      [
        ["/home", accumulator3],
        ["/about", accumulator1],
        ["/contact", accumulator2],
      ]
    }

    it { is_expected.to eql(expected_output) }
  end
end
