module Caramello
  module DSL
    class TestBehaviour
      def initialize(string, &block)
      end

      def equal(value)
        Caramello::Matcher::MatchEquality.new(value)
      end
    end
  end
end
