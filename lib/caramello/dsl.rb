module Caramello
  module Dsl
    class << self
      def explain(desc, parent = nil, &block)
        Caramello::Context.setup(desc, self, &block)
      end

      def test_case(desc, &block)
        Caramello::TestCase.new(desc, &block)
      end

      def contend(value)
        Caramello::Contention.new(value)
      end

      def equal(value)
        Caramello::Matcher::MatchEquality.new(value)
      end
    end
  end
end
