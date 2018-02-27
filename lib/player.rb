require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name , :plays, :tiles

    def initialize name
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
        if word !~ /^[a-zA-Z]{0,7}$/ || word == ""
          raise ArgumentError.new("Invalid word entry")
        end

      if won?
        return false
      else
        word.split("").each do |letter|
          @tiles.delete(letter)
        end
      end
        @plays << word
        return Scoring.score(word)
      end

      def total_score
        return @plays.map{ |word| Scoring.score(word) }.sum
      end

      def won?
        return total_score > 100
      end

      def highest_scoring_word
        return Scoring.highest_score_from(@plays)
      end

      def highest_word_score
        return Scoring.score(highest_scoring_word)
      end

      def draw_tiles(tile_bag)
        num = 7 - tiles.length

        if tile_bag.tiles_remaining < num
          @tiles += tile_bag.draw_tiles(tile_bag.tiles_remaining)
        else
          @tiles += tile_bag.draw_tiles(num)
        end

      end

    end
  end
