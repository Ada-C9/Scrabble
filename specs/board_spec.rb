require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

# require_relative '../lib/player'
require_relative '../lib/board'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'board' do
  describe 'initialize' do
    # Creates a new board
    it 'creates a board' do
      test_board = Scrabble::Board.new()

      test_board.must_be_kind_of Scrabble::Board
    end

    it 'only creates a board if the values are integers > 0' do
      assert_raises{Scrabble::Board.new(-3)}
      assert_raises{Scrabble::Board.new("breaking your code")}
    end
  end

  describe 'return' do
    it 'returns the string output of the board' do
      test_board = Scrabble::Board.new()

      line =  "----" * 16
      row =  "\n#{"|   " * 16}|\n"
      whole_board = "#{"#{line}#{row}" * 16}#{line}"

      test_board.print_board.must_equal whole_board
    end

    it "adjusts for different board sizes" do
      test_board = Scrabble::Board.new(3)
      line = "------------"
      row = "\n|   |   |   |\n"
      whole_board = "#{line}#{row}#{line}#{row}#{line}#{row}#{line}"

      test_board.print_board.must_equal whole_board
    end

    it 'adds letters correctly' do
      # TODO
    end
  end

  describe 'add word' do
    it "adds a word to the board and returns 'true'" do
      test_board = Scrabble::Board.new()
      test_board.add_word([5, 3], "MAGGIE").must_equal true
    end

    it "returns 'false' if cannot added at valid position" do
      test_board = Scrabble::Board.new()

      test_board.add_word([5, 3], "MAGGIE")
      test_board.add_word([5, 1], "PUDDING").must_equal false
    end

    it "returns 'nil' if provided coordinate outside range'" do
      test_board = Scrabble::Board.new()
      assert_nil test_board.add_word([99, 3], "MAGGIE")
      assert_nil test_board.add_word([3, 99], "MAGGIE")
    end

    it "returns 'nil' if word is not a string'" do
      test_board = Scrabble::Board.new()
      assert_nil test_board.add_word([5, 3], :maggie)
    end

    it "returns 'nil' if word is empty'" do
      test_board = Scrabble::Board.new()
      assert_nil test_board.add_word([5, 3], "")
    end

    it "returns 'nil' if word is contains any spaces'" do
      test_board = Scrabble::Board.new()
      assert_nil test_board.add_word([5, 3], "   ")
      assert_nil test_board.add_word([2, 3], "HELLO MAGGIE")
    end

    it "returns 'nil' if word is contains any non-letters'" do
      test_board = Scrabble::Board.new()
      assert_nil test_board.add_word([2, 3], "HELLO,MAGGIE")
    end


  end
end
