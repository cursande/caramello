require 'optparse'

module Caramello
  class CLI
    def initialize(args = Dir.glob('./**/*_test.rb'))
      parse(args)
    end

    private

    def parse(args)
      options = {}

      OptionParser.new do |parser|
        parser.on '-sSTYLE', '--style=STYLE' do |style_option|
          bail_unless_style_exists?(style_option)

          options[:style] = style_option
        end

        parser.on_tail '-v', '--version' do
          puts Caramello::VERSION; exit
        end
      end.parse!(args)

      test_paths = collect_test_files(args)
      run(test_paths, options)
    end

    def bail_unless_style_exists?(style_option)
      puts "style option '#{style_option}' not found!" unless File.exists?("styles/#{style_option}.yml")
    end

    # Return both file paths in args, and _test.rb files in
    # directories in args
    def collect_test_files(args)
      args.each_with_object([]) do |arg, test_paths|
        if File.file?(arg)
          test_paths << arg
        elsif File.directory?(arg)
          test_paths << Dir.glob(arg + '/**/*_test.rb')
        end
      end.flatten
    end

    def run(test_paths, options = {})
      puts "No Caramello tests found!"; exit if test_paths.empty?

      Runner.new(test_paths, options).run
    end
  end
end
