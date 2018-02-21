require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

describe "Scrabble Player" do
  let(:player) { Scrabble::Player.new("Anonymous")}
  describe "#initialize" do
    it "validates and instantiates the name instance variable" do
      player.must_respond_to :name
      player.name.must_be_instance_of String
      player.name.must_equal "Anonymous"
    end
    it "#plays returns an Array of the words played by the player
    " do
    player.plays.must_respond_to :plays
    player.plays.must_be_instance_of Array
    player.plays.must_equal []
  end

end
end
