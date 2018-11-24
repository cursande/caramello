module Caramello
  module DSL
    def contend(value)
      Caramello::Contention.new(value)
    end

    def equal(value)
      Caramello::Matcher::MatchEquality.new(value)
    end
  end
end
