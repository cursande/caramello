module Caramello
  module Dsl
    class << self
      def explain(desc, parent = nil, &block)
        Context.setup(desc, parent, &block)
      end

      def test_case(desc, &block)
        TestCase.new(desc, &block)
      end

      def contend(value)
        Contention.new(value)
      end

      def equal(value)
        Matcher::MatchEquality.new(value)
      end
    end
  end
end
