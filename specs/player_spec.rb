require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require 'pry'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'initialize' do
    it "Takes a name" do
      player = Scrabble::Player.new("Paul")

      player.must_respond_to :name
      player.name.must_equal "Paul"      
    end
  end

  describe 'plays' do
  end

  describe 'play' do
  end

  describe 'total_score' do

  end

  describe 'won?' do

  end

  describe 'highest_scoring_word' do

  end

  describe 'highest_word_score' do
  end

end
