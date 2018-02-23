require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe 'initialize' do

    it 'correctly takes in a name and return the name' do
      name = "Hannah"
      player_1 = Scrabble::Player.new("Hannah")

      player_1.name.must_be_kind_of String
      player_1.name.must_equal name
    end

  end

  xdescribe 'plays' do

    it 'correctly returns an array of the words played by the player' do
      Scrabble::Player.new("Hannah").plays.must_be Array
    end

  end

  describe 'play(word)' do

    it 'correctly adds the inputs words to the array in plays' do
      word = "cat"
      player_1 = Scrabble::Player.new("Hannah")
      scrabble_word = player_1.play(word)

      scrabble_word.must_equal ["cat"]
    end

  end

end
