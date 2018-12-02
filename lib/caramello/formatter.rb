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
  end
end
