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
      assert_raises{Scrabble::Board.new(0)}
      assert_raises{Scrabble::Board.new("breaking your code")}
    end
  end

  describe 'return' do
    it 'returns the string output of the board' do
      test_board = Scrabble::Board.new()

      line =  "----" * 16
      row =  "\n#{"|   " * 16}|\n"
      whole_board = "#{"#{line}#{row}" * 16}#{line}"

      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   | M | A | G | G | I | E |
      # ----------------------------------------------------------------

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
      test_board = Scrabble::Board.new(4)
      test_board.add_word([1, 1], "CAT")
      line = "----------------"
      row = "\n|   |   |   |   |\n"
      set_a = "#{line}#{row}"
      set_d = "|   |   |   |\n#{line}\n"

      # ----------------
      # | C | A | T |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      across = "#{line}\n| C | A | T |   |\n#{set_a}#{set_a}#{set_a}#{line}"

      # ----------------
      # | C |   |   |   |
      # ----------------
      # | A |   |   |   |
      # ----------------
      # | T |   |   |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      down = "#{line}\n| C #{set_d}| A #{set_d}| T #{set_d}#{row.lstrip}#{line}"

      test_board.print_board.must_equal across || down

    end
  end

  describe 'add word down' do
    it "adds a word to the board and returns 'true'" do
      word = "MAGGIE"
      test_board = Scrabble::Board.new()
      test_board.add_word([5, 3], "MAGGIE").must_equal word
    end

    it "returns 'word' if is forced along board edge" do
      test_board = Scrabble::Board.new()
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      # ----------------------------------------------------------------
      # |   |   |   |   |   |   |   |   |   |   | M | A | G | G | I | E |
      # ----------------------------------------------------------------
      expected_board_end =  "| M | A | G | G | I | E |\n#{"----" * 16}"
      test_board.add_word([16, 11], "MAGGIE").must_equal "MAGGIE"

      test_board.print_board.slice!(-90..-1).must_equal expected_board_end
    end

    xit "returns 'word' if is forced into a valid position" do
      test_board = Scrabble::Board.new()
      word = "PUDDLES"
      test_board.add_word([5, 3], "MAGGIE")
      test_board.add_word([5, 1], word).must_equal word
      # puts test_board.print_board
    end

    it "returns 'word' if is forced to overlap in valid position" do
      test_board = Scrabble::Board.new()
      word = "PUDDLES"
      test_board.add_word([16, 11], "MAGGIE").must_equal "MAGGIE"
      # test_board.add_word([5, 1], word).must_equal word
      puts test_board.print_board
    end

    it "returns 'nil' if provided coordinate outside range'" do
      test_board = Scrabble::Board.new()
      assert_nil test_board.add_word([99, 3], "MAGGIE")
      assert_nil test_board.add_word([3, 99], "MAGGIE")
      assert_nil test_board.add_word([3, -1], "MAGGIE")
      assert_nil test_board.add_word([-1, 12], "MAGGIE")
      assert_nil test_board.add_word([0, 3], "MAGGIE")
      assert_nil test_board.add_word([3, 0], "MAGGIE")
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
