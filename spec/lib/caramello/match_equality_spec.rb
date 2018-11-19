require 'spec_helper'

# TODO: Test the individual classes separately and then just an integration test
# with the DSL?
RSpec.describe Caramello::Matcher::MatchEquality do
  subject { described_class }

  describe '#equal' do
    context 'when a and b are integers and equal' do
      it 'marks the test as passed if it matches the expectation' do
        expect(subject.new(5).condition_met?(5)).to be true
      end
    end

    context 'when a and b are integers and unequal' do
      it 'marks the test as failed if it does not match the expectation' do
        expect(subject.new(5).condition_met?(10)).to be false
      end
    end
  end
end
