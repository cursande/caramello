module Caramello
  module Dsl
    class << self
      def contend(value)
        Caramello::Contention.new(value)
      end

      def equal(value)
        Caramello::Matcher::MatchEquality.new(value)
      end
    end
  end
end
