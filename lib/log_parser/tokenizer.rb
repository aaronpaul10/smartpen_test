module LogParser
  class Tokenizer
    def initialize(arr_lines)
      @arr_lines = arr_lines
    end

    def create_entries
      @arr_lines.lazy.map do |line|
        Entry.new(*line.split)
      end
    end
  end
end
