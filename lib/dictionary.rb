require 'csv'
require 'awesome_print'


# Create a `Scrabble::Dictionary` class that includes a method (class or
# instance) for searching a list of words to determine if a given word is
# valid (__must have tests__).

module Scrabble
  class Dictionary

    @@all_words = []

    def self.is_word?(word)
      raise ArgumentError.new("Invalid input: #{word}") if word.class != String
      build_all_words if @@all_words.empty?
      return @@all_words.include?(word)
    end

    private

    def self.build_all_words
      words = CSV.read('support/all_words.csv')
      # @@all_words << words.split(",")
      # puts words[0..3].inspect
      words[0].each { |word| @@all_words << word}
    #   @@all_words = words.to_h
      # ap @@all_words
    end

  end
end


# puts Scrabble::Dictionary.is_word?("qi")
# puts Scrabble::Dictionary.is_word?("hello")
