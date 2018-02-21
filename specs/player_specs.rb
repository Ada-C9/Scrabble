require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe Player do

  describe initialize do

    it "The new player must be an instance of Player" do
      Scrabble::Player.new("Ana").must_be_instance_of Player
    end

    it "The name is a kind of string" do
      Scrabble::Player.new(43687).name.must_be_kind_of String
    end
  end
end
