# require "awesome_print"
#
# require_relative "player"
# require_relative "tilebag"
# require_relative "scoring"

# # Attempt at player option enhancement that takes the word and compares
# # it to the player tiles only allowing player to play from their hand
# # Raise an ArgumentError if word is available to player and allows them
# # to try a new input

# # Still needs some work to make sure it is matching the array letter
# # for letter

# # Also doesn't currently work with test for rest of class because uncertain
# # how to write test for randomly generated 'tiles'

# module Scrabble
#   class Player
#     def play(word)
#       return false if won?
#       remaining_tiles = @tiles.reject { |letter| word.upcase.include?(letter) }
#       begin
          # #
#         if word.length + remaining_tiles.length != @tiles.length
#           raise ArgumentError.new ("Don't have those tile to play")
#         end
#       rescue ArgumentError => ex
#         puts ex
#         puts "#{@tiles}"
#         puts "What new word would you like to play?"
#         word = gets.chomp
#         play(word)
#       end
#
#       word_score = Scoring.score(word)
#       return if word_score.nil?
#       @plays << word
#       @total_score += word_score
#       @tiles -= word.upcase.split("")
#       return word_score
#     end
#   end
# end

# # Testing enhancement and how it plays
# bag = Scrabble::TileBag.new
# player = Scrabble::Player.new("BamBam")
# ap player.draw_tiles(bag)
# ap player.tiles
# ap player.play("look")
# ap player.tiles
