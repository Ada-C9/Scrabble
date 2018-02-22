require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe '#name' do
    it 'returns the instance variable name for instance of Player' do
      angie = Scrabble::Player.new("Angie")
      angie.must_respond_to :name
      angie.name.must_equal "Angie"
    end
  end

  describe '#play' do
  end

  describe '#play(word)' do
  end

  describe '#total_score' do
  end

  describe '#won?' do
  end

  describe '#highest_scoring_word' do
  end

  describe '#highest_word_score' do
  end


end # describe Player
