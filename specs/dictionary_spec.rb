require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/dictionary'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Scrabble::Dictionary' do
  describe 'Dictionary#find' do
    it 'should take input and return true if found in the array or false if not found in the array' do
      Scrabble::Dictionary.find('dog').must_equal true
      Scrabble::Dictionary.find('qqqqq').must_equal false
    end
  end
end
