module LogParser
  class Parser
    def initialize(input, options = {})
      @input = input
      @formatter = options[:formatter] || Formatter
      @tokenizer = options[:tokenizer] || Tokenizer
      @reader = options[:reader] || Reader
      @aggregator = options[:aggregator] || Aggregator
    end

    def format
      @formatter.new(aggregate_data).format
    end

    private

    def aggregate_data
      @aggregator.new(tokenize_data).group_data
    end

    def tokenize_data
      @tokenizer.new(get_data).create_entries
    end

    def get_data
      @reader.new(@input).file_lines
    end
  end
end
