module Caramello
  class Runner

    def initialize(paths, style)
      @paths = paths
      @style = style
    end

    def run
      @paths.each do |path|
        load(path)
      end

      Caramello.run
    end
  end
end
