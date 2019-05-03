require 'optparse'

module Caramello
  class CLI

    def initialize(args)
      parse(args)
    end

    private

    def parse(args)
      OptionParser.new do |options|
        options.on "-s", "--style" do |style|
          style = style
        end

        options.on_tail "-v", "--version" do
          puts Caramello::VERSION
          exit
        end
      end

      spec_paths = args.select { |s| s.match?(/\A(.*).rb\Z/) }
      run(spec_paths, style)
    end

    def run(spec_paths, style = nil)
      return if spec_paths.empty?

      #TODO: Write the runner!
      Runner.new(spec_paths, style).run
    end
  end
end
