require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/dictionary'
require 'pry'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe 'Dictionary' do
  before do
    @dictionary = Scrabble::Dictionary.new("support/word_list.txt")
  end

  describe 'valid' do
    it "Returns true if a given word is valid" do
      @dictionary.valid?("ability").must_equal true
    end

    it "Returns false if a given word is not valid" do
      @dictionary.valid?("abc").must_equal false
    end
  end
end
