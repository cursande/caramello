module Caramello
  class Runner
    def initialize(paths, options)
      @paths = paths
      @style = options[:style]
      @counter = Counter.new
    end

    def run
      @paths.each do |path|
        load(path)
      end
      # TODO: Feels clunky having to pass in the counter here, and to each context...
      Caramello.run(@counter)
      Caramello.formatter.review(@counter, @style)
    end
  end
end
