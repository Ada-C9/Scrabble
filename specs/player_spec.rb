require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  before do
    @player = Scrabble::Player.new("kate")
    @player.play("dog")
    @player.play("cat")
    @player.play("rooster")
  end
  describe '#initialize method' do
    it "takes a name" do

      @player.must_respond_to :name
      @player.name.must_equal "kate"
    end

    it "Creates a player with an Array of played words" do

      @player.must_respond_to :plays
      @player.plays.must_equal ["dog","cat","rooster"]
      @player.plays.must_be_instance_of Array
    end

    it "responds to the total_score to 0" do

      @player.must_respond_to :total_score
    end
 end

  describe '#play method' do
    it "Scrabble::Player responds to plays" do

      @player.must_respond_to :play
      @player.must_respond_to :plays
   end

    it "adds an input word to plays array" do
      @player.play("tiger")
      @player.plays.must_include "tiger"
    end

    it "returns an array of words" do

      @player.plays.must_equal ["dog","cat","rooster"]
      @player.plays.must_be_kind_of Array
    end
  end

  describe '#total_score method' do
    it "responds to total_score of the played word" do

      @player.total_score.must_equal 67
      @player.total_score.must_be_kind_of Integer
    end


  end

end
