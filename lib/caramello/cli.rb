require 'optparse'

module Caramello
  class CLI

    def initialize(args = Dir.glob('./**.*'))
      parse(args)
    end

    private

    def parse(args)
      options = {}

      OptionParser.new do |opt|
        opt.on "-s", "--style" do |style_option|
          options[:style] = style_option
        end

        opt.on_tail "-v", "--version" do
          puts Caramello::VERSION
          exit
        end
      end

      test_paths = args.select { |s| s.match?(/\A(.*)_test.rb\Z/) }
      run(test_paths, options)
    end

    def run(test_paths, options = {})
      return if spec_paths.empty?

      Runner.new(spec_paths, options).run
    end
  end
end
