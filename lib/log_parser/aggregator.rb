module LogParser
  class Aggregator
    def initialize(entries)
      @entries = entries
    end

    def group_data
      @entries.each_with_object(AggregatorResult.new) do |entry, data|
        data[entry.path] ||= Accumulator.new
        data[entry.path].add(entry)
      end
    end
  end
end
