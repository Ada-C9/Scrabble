require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/dictionary'
require 'pry'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe 'Dictionary' do

  describe 'valid' do
    it "Returns true if a given word is valid" do
      Scrabble::Dictionary.valid?("a").must_equal true
      Scrabble::Dictionary.valid?("yourself").must_equal true
    end

    it "Returns false if a given word is not valid" do
      Scrabble::Dictionary.valid?("abc").must_equal false
      Scrabble::Dictionary.valid?("").must_equal false
    end
  end

end
