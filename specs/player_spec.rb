require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe 'Player' do
  describe 'name' do
    it 'can return a name' do
      #Arrange
      name = 'Gordon'
      #Act/Assert
      Scrabble::Player.new(name).name.must_equal 'Gordon'
    end

    # xit '' do
    #
    # end
  end

  describe 'plays' do
    it 'it can return an array' do
      player = Scrabble::Player.new('')
      player.plays.must_be_instance_of Array
    end

    # xit '' do
    #
    # end
  end

  describe 'play(word)' do
    # Feedback mentions testing edge cases for this method
    it 'takes word and adds it to the plays array' do
    # arrange
      word = 'batshit'
      player = Scrabble::Player.new('')

      # Act
      player.play(word)

      # Assert
      player.plays.must_include 'batshit'
    end

    it 'returns false if player has already won' do
      # Arrange
      word = "crazy"
      word_1 = 'janky'
      word_2 = 'coding'
      word_3 = 'dancing'
      word_4 = 'hah'
      player = Scrabble::Player.new('')

      # Act
      player.play(word)
      player.play(word_1)
      player.play(word_2)
      player.play(word_3)

      # Assert
      player.play(word_4).must_equal false

    end

    it 'returns score of the word' do
      word = "guano"
      Scrabble::Player.new('').play(word)

      Scrabble::Scoring.score(word).must_equal 6

      # Scrabble::Player.new('').play(word).score(word).must_equal 7
    end
  end

  xdescribe 'total_score' do
    xit 'Returns the sum of scores of played words' do
      # Arrange
      player = Scrabble::Player.new('')
      word = "crazy"
      word_1 = 'janky'
      word_2 = 'coding'
      word_3 = 'dancing'
      word_4 = 'hah'

      # Act
      player.play(word)
      player.play(word_1)
      player.play(word_2)
      player.play(word_3)
      player.plays
      player.total_score

      # Assert
      player.total_score.must_be Integer


    end

    xit '' do

    end
  end

  describe 'won?' do
    it 'if player has > 100 point score, return true' do
      word = "crazy"
      word_1 = 'janky'
      word_2 = 'coding'
      word_3 = 'dancing'
      word_4 = 'hah'
      player = Scrabble::Player.new('')

      # act
      player.play(word)
      player.play(word_1)
      player.play(word_2)
      player.play(word_3)
      player.total_score

      # Assert
      player.won.must_equal true
    end

    xit '' do

    end
  end

  describe 'highest_scoring_word' do
    it 'Returns highest scoring played_word' do
      word = "crazy"
      word_1 = 'janky'
      # word_2 = 'coding'
      word_3 = 'dancing'
      # word_4 = 'hah'
      player = Scrabble::Player.new('')

      player.play(word)
      player.play(word_1)
      # player.play(word_2)
      player.play(word_3)

      player.highest_scoring_word.must_equal 'dancing'


    end

    xit '' do

    end
  end
end
