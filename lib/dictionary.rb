# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

# Used Scrabble::DictionaryBuilder (lib/dictionary_files_builder.rb) to create
# the file (support/all_words.csv) the list is pulled from. All the words in
# all_words.csv should contain 1 - 7 letters, but this program checks anyways.

require 'csv'

module Scrabble
  class Dictionary

    @@all_words = []

    # Throws ArgumentError if provided word is not a String.
    # Returns 'true' if word is in the dictionary and 'false' otherwise.
    def self.is_word?(word)
      raise ArgumentError.new("Invalid input: #{word}") if word.class != String
      build_all_words if @@all_words.empty?
      return @@all_words.include?(word.upcase)
    end

    # Returns all the words in the dictionary.
    def self.get_all_words
      build_all_words if @@all_words.empty?
      return @@all_words
    end

    private

    # Populates @@all_words with word less than MAX_LETTERS in length.
    def self.build_all_words
      # Based on the version of Scrabble::DictionaryBuilder as of (2/26/18),
      # which created files with all the words in one row.
      CSV.read('support/all_words.csv').each do |row|
        row.each { |word| @@all_words << word if word.length.between?(1, 7) }
      end
    end

  end
end
