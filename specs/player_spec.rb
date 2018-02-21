require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe 'Player' do
describe "#initialize" do
  it "Takes a Player name" do
    player_1 = Scrabble::Player.new("Patrick")
    player_1.must_be_instance_of Scrabble::Player

    player_1.must_respond_to :name
    player_1.name.must_equal "Patrick"
    player_1.name.must_be_kind_of String

  end

end

end
