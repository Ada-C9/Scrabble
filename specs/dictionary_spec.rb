# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/dictionary'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Dictionary' do
  describe 'is_word?' do
    it 'returns "true" if String in dictionary' do
      Scrabble::Dictionary.is_word?("hello").must_equal true
      Scrabble::Dictionary.is_word?("HELLO").must_equal true
    end

    it 'returns "false" if String is not in dictionary' do
      Scrabble::Dictionary.is_word?("qi").must_equal false
      Scrabble::Dictionary.is_word?("QI").must_equal false
    end

    it 'returns an error for non-String input' do
      proc { Scrabble::Dictionary.is_word?(nil) }.must_raise ArgumentError
      proc { Scrabble::Dictionary.is_word?([]) }.must_raise ArgumentError
    end
  end

  describe 'get_all_words' do
    all_words_array = Scrabble::Dictionary.get_all_words

    it 'returns an array of Strings' do
      all_words_array.must_be_kind_of Array
      all_words_array.all?(String).must_equal true
    end

    it 'contains all the words in all_words csv file' do
      array_from_csv = CSV.read('support/all_words.csv')[0]
      array_from_csv.delete_if {|word| word.length > 7 }

      all_words_array.size.must_equal array_from_csv.size
      all_words_array.must_equal array_from_csv

      all_words_array[0].must_equal array_from_csv[0]
      all_words_array.last.must_equal array_from_csv.last
    end
  end
end
