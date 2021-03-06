require 'spec_helper'

# TODO: This tests the cli interface but I still need a proper end-to-end test
RSpec.describe Caramello::CLI do
  subject { described_class }

  context 'with no arguments passed' do
    let(:args) { [] }

    it 'just runs the test cases with default options' do
      expect_any_instance_of(subject)
        .to receive(:run)
        .with([
          './spec/lib/caramello/fixtures/passing_test.rb',
          './spec/lib/caramello/fixtures/failing_test.rb'
        ], {})

      subject.new
    end
  end

  context 'with a path provided' do
    context 'with a path to a file provided' do
      let(:args) { ['./spec/lib/caramello/fixtures/passing_test.rb'] }

      it 'runs test cases within the file specified' do
        expect_any_instance_of(subject)
          .to receive(:run)
          .with(['./spec/lib/caramello/fixtures/passing_test.rb'], {})

        subject.new(args)
      end
    end

    context 'with a path to a directory provided' do
      let(:args) { ['./spec/lib/caramello/fixtures'] }

      it 'runs test cases within the directory specified' do
        expect_any_instance_of(subject)
          .to receive(:run)
          .with([
            './spec/lib/caramello/fixtures/passing_test.rb',
            './spec/lib/caramello/fixtures/failing_test.rb'
          ], {})

        subject.new(args)
      end
    end
  end

  context 'when no test files are found' do
    let(:args) { ['./spec/lib/caramello/fixtures/foo'] }

    it 'exits, with output declaring no tests were found' do
      expect { subject.new(args) }
        .to raise_error(SystemExit)
        .and output("No Caramello tests found!\n")
        .to_stdout
    end
  end

  context 'with a style option passed in as an argument' do
    let(:args) { ['./spec/lib/caramello/fixtures/passing_test.rb','-s', 'rodney'] }

    it 'applies the style option when formatting stdout' do
      expect_any_instance_of(subject)
        .to receive(:run)
        .with(
          ['./spec/lib/caramello/fixtures/passing_test.rb'],
          { style: 'rodney' }
        )

      subject.new(args)
    end
  end

  context 'with the version passed in as an argument' do
    let(:args) { ['-v'] }

    it 'prints the current version of Caramello to stdout' do
      expect{ subject.new(args) }
        .to raise_error(SystemExit)
        .and output("#{Caramello::VERSION}\n")
        .to_stdout
    end
  end
end
