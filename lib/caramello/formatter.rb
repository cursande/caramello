require 'yaml'

module Caramello
  class Formatter
    def initialize(logger)
      @logger = logger
    end

    def record(test_case, result)
      message = if result.fetch(:pass)
                  "#{test_case.desc} - ✔"
                else
                  "#{test_case.desc} - ⨯ [#{result.fail_message}]"
                end

      @logger.log(message)
    end

    def explain(context)
      @logger.log(context.desc)
      yield
    end

    def review(fail_count, style)
      style_options = YAML.load_file("styles/#{style}.yml").fetch('style')

      result = fail_count < 1 ? 'success' : 'failure'
      message = style_options.fetch(result).sample

      @logger.log(message)
    end
  end
end
