module LogParser
  class Reader
    def initialize(file_path)
      @path = file_path
    end

    def file_lines
      handle.each.lazy.map(&:chomp)
    end

    private

    def handle
      File.open(@path, "r")
    rescue Errno::ENOENT, Errno::EACCESS => e
      raise LogParser::Error, e.message
    end
  end
end
