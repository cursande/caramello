require 'spec_helper'

# Is it even worth testing this??
RSpec.describe Caramello::Dsl do
  subject { described_class }

  context 'with a passing test' do
    it 'does not raise an error' do
      expect{ subject.contend(1 + 3).to(subject.equal(4)) }
        .to_not raise_error
    end
  end

  context 'with a failing test' do
    it 'raises a ContentionNotMet error' do
      expect{ subject.contend(1 - 3).to(subject.equal(2)) }
        .to raise_error(Caramello::Contention::ConditionNotMetError, "Predicted: 2\nResult: -2")
    end
  end
end
