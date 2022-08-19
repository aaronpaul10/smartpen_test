RSpec.describe LogParser::Formatter do
  let(:formatter) { described_class.new(aggregator_result) }
  let(:aggregator_result) {
    LogParser::AggregatorResult[
      "/contact" => instance_double(LogParser::Accumulator, unique: 80, total: 85),
      "/about" => instance_double(LogParser::Accumulator, unique: 50, total: 100),
      "/home" => instance_double(LogParser::Accumulator, unique: 150, total: 200)
    ]
  }

  describe "class method #format" do
    subject { formatter.format }

    let(:expected_output) {
      <<~EOF
        Page paths ordered by total hits:
        /home 200 total visits
        /about 100 total visits
        /contact 85 total visits

        Page paths ordered by unique visits:
        /home 150 unique visits
        /contact 80 unique visits
        /about 50 unique visits
      EOF
    }

    it { is_expected.to eql(expected_output) }
  end
end
