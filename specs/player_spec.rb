require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'initialize' do
    it 'initializes with a name' do
      name = 'Bashful'

      player = Scrabble::Player.new(name)

      player.must_be_kind_of Scrabble::Player
      player.must_respond_to :name
      player.name.must_equal 'Bashful'
    end

    it 'has default name value if provided empty String' do
        name = "    "

        player = Scrabble::Player.new(name)

        player.must_be_kind_of Scrabble::Player
        player.name.must_equal 'AnnoyingOne'
    end

    it 'has default name value if provided non-String' do
        name = nil

        player = Scrabble::Player.new(name)

        player.must_be_kind_of Scrabble::Player
        player.name.must_equal 'AnnoyingOne'
    end
  end

  
end
