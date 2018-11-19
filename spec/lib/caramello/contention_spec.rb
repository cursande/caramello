require 'spec_helper'

RSpec.describe Caramello::Contention do
  subject { described_class }

  describe '#to' do
    context 'when the contention is passed a matcher object' do
      let(:matcher) { Caramello::Matcher::MatchEquality }

      it 'does not raise if the condition is met' do
        expect{ subject.new('foo').to matcher.new('foo') }.to_not raise_error
      end


      it 'raises if the condition is not met' do
        expect{ subject.new('foo').to matcher.new('bar') }.to raise_error(subject::ConditionNotMetError)
      end
    end
  end
end
