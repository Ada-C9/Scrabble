require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/dictionary'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Dictionary' do
  describe 'is_word?' do
    it 'returns "true" if String in dictionary' do
      Scrabble::Dictionary.is_word?('hello').must_equal true
    end

    it 'returns "false" if String is not in dictionary' do
      Scrabble::Dictionary.is_word?('qi').must_equal false

    end

    it 'returns an error for non-String input' do
      proc { Scrabble::Dictionary.is_word?(nil) }.must_raise ArgumentError
      proc { Scrabble::Dictionary.is_word?([]) }.must_raise ArgumentError
    end
  end
end
