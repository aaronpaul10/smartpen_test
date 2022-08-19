module LogParser
  class Formatter
    def initialize(aggregator_result)
      @aggregator_result = aggregator_result
    end

    def format
      <<~EOF
        Page paths ordered by total hits:
        #{paths_ordered_total_views}

        Page paths ordered by unique visits:
        #{paths_ordered_unique_views}
      EOF
    end

    private

    def paths_ordered_total_views
      @aggregator_result.sort_by_total_views.map do |path, data|
        "#{path} #{data.total} total visits"
      end.join("\n")
    end

    def paths_ordered_unique_views
      @aggregator_result.sort_by_unique_views.map do |path, data|
        "#{path} #{data.unique} unique visits"
      end.join("\n")
    end
  end
end
