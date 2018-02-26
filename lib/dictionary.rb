module Scrabble
  class Dictionary

    FILE_NAME = "support/word_list.txt"

    def self.valid?(word)
      Scrabble::Dictionary.load_words.include?(word)
    end

    def self.load_words
      words = []
      File.open(FILE_NAME) do |file|
        file.each do |line|
          words << line.chomp
        end
      end
      return words
    end

  end
end
