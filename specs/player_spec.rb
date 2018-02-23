require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

describe 'player' do
  before do
     @player = Scrabble::Player.new("Maddie")
  end

  describe "initialize" do

    it "must be an instance of player class" do
    @player.must_be_instance_of Scrabble::Player
    end

    it "must returns the value of the @name instance variable" do
    @player.name.must_equal "Maddie"
    end

  end
end
