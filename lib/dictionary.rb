require 'csv'

module Scrabble
  class Dictionary
    @@dictionary = []
    CSV.read('support/dictionary.csv').each do |word_array|
      @@dictionary << word_array[0]
    end

    def self.find(word)
      if @@dictionary.include?(word)
        return true
      else
        return false
      end
    end

    def self.dictionary_read
      return @@dictionary
    end

  end
end
