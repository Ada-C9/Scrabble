module Scrabble
  class Dictionary

    def initialize(file_name)
      @words = []
      File.open(file_name) do |file|
        file.each do |line|
          @words << line.chomp
        end
      end
    end

    def valid?(word)
      @words.include?(word)
    end

  end
end
