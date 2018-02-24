require 'csv'

module Scrabble
  class Dictionary
    @@dictionary = []
    CSV.read('support/dictionary.csv').each do |word|
      @@dictionary << word
    end

    def self.find(word)
      if @@dictionary.flatten.include?(word)
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
