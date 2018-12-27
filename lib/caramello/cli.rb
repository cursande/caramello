require 'optparse'

module Caramello
  class CLI

    def initialize(items)
      parse(items)
    end

    private

    def parse(items)
      OptionParser.new do |options|
        options.on "-s", "--style" do |style|
          # Here we could set which YAML or JSON file we pull test responses from
        end
      end

      spec_paths = items.select { |s| s.match?(/\A(.*).rb\Z/) }
      run(spec_paths)
    end

    def run(spec_paths)
      return if spec_paths.empty?

      #TODO: Write the runner!
      Runner.new(spec_paths).run
    end
  end
end
