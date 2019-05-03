require 'spec_helper'

RSpec.describe Caramello::CLI do
  context 'with no arguments passed' do
    let(:args) { nil }

    pending 'just runs the test cases with default options' do
    end
  end

  context 'with a style option passed in as an argument' do
    let(:args) { ['-s', 'rodney'] }

    pending 'applies the style option when formatting stdout' do
    end
  end

  context 'with the version passed in as an argument' do
    let(:args) { '-v' }

    pending 'prints the current version of Caramello to stdout' do
    end
  end
end
