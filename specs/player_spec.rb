require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe 'initialize' do
  end

  describe 'play(word)' do
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
