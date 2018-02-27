# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

# ** Used to build the dictionary lists from dictionary.csv **

# require 'csv'
#
# module Scrabble
#
#   class DictionaryBuilder
#
#     def initialize()
#       @seven_letter_words = []
#       @six_letter_words = []
#       @five_letter_words = []
#       @four_letter_words = []
#       @three_letter_words = []
#       @two_letter_words = []
#       @all_words = []
#     end
#
#     def build_words_arrays
#       CSV.read('../support/dictionary.csv').each do |row|
#         word = row.pop
#          word = word.upcase
#         num_of_chars = word.length
#         next if num_of_chars > 7 || !word.match?(/^[A-Z]+$/)
#         @all_words << word
#         case num_of_chars
#         when 2
#           @two_letter_words << word
#         when 3
#           @three_letter_words << word
#         when 4
#           @four_letter_words << word
#         when 5
#           @five_letter_words << word
#         when 6
#             @six_letter_words << word
#         when 7
#           @seven_letter_words << word
#         end
#       end
#     end
#
#     def build_all_files
#       CSV.open("../support/two_letter_words.csv", "w") do |file|
#         file << @two_letter_words
#       end
#
#       CSV.open("../support/three_letter_words.csv", "w") do |file|
#         file << @three_letter_words
#       end
#
#       CSV.open("../support/four_letter_words.csv", "w") do |file|
#         file << @four_letter_words
#       end
#
#       CSV.open("../support/five_letter_words.csv", "w") do |file|
#         file << @five_letter_words
#       end
#
#       CSV.open("../support/six_letter_words.csv", "w") do |file|
#         file << @six_letter_words
#       end
#
#       CSV.open("../support/seven_letter_words.csv", "w") do |file|
#         file << @seven_letter_words
#       end
#
#       CSV.open("../support/all_words.csv", "w") do |file|
#         file << @all_words
#       end
#     end
#
#   end
# end
#
# bob_the_builder = Scrabble::DictionaryBuilder.new
# bob_the_builder.build_words_arrays
# bob_the_builder.build_all_files
