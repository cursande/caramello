module Caramello
  class Runner
    def initialize(paths, options)
      @paths = paths
      @style = options[:style]
      @fail_count = 0
    end

    def run
      @paths.each do |path|
        load(path)
      end

      Caramello.run(@fail_count)
      Caramello.formatter.review(@fail_count, @style)
    end
  end
end
