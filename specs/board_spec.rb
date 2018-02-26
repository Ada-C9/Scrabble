require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/board'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'board' do
  describe 'initialize' do
    it 'creates a board' do
      test_board = Scrabble::Board.new()
      test_board.must_be_kind_of Scrabble::Board #attr_reader test needed!
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

      # Board does not print with letters and numbers
      #
      #     1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16
      #   ----------------------------------------------------------------
      # A |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # B |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # C |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # D |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # E |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # F |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # G |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # H |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # I |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # J |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # K |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # L |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # M |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # N |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # O |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------
      # P |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
      #   ----------------------------------------------------------------

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
      test_board.add_word("A", 1, "DOG")
      line = "----------------"
      row = "\n|   |   |   |   |\n"
      set_a = "#{line}#{row}"
      set_d = "|   |   |   |\n#{line}\n"

      # ----------------
      # | D | O | G |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      across = "#{line}\n| D | O | G |   |\n#{set_a}#{set_a}#{set_a}#{line}"

      # ----------------
      # | D |   |   |   |
      # ----------------
      # | O |   |   |   |
      # ----------------
      # | G |   |   |   |
      # ----------------
      # |   |   |   |   |
      # ----------------
      down = "#{line}\n| D #{set_d}| O #{set_d}| G #{set_d}#{row.lstrip}#{line}"

      # TODO: what's up with this??
      # must set equal to variable so it doesn't keep calling it to compare.
      board_as_string = test_board.print_board
      is_equal = board_as_string == down || board_as_string == across
      is_equal.must_equal true
    end

    it 'Switches at random' do
      line = "----------------"
      row = "\n|   |   |   |   |\n"
      set_a = "#{line}#{row}"
      set_d = "|   |   |   |\n#{line}\n"

      across = "#{line}\n| D | O | G |   |\n#{set_a}#{set_a}#{set_a}#{line}"
      down = "#{line}\n| D #{set_d}| O #{set_d}| G #{set_d}#{row.lstrip}#{line}"

      attempt_count = 0
      across_count = 0
      down_count = 0

      while attempt_count < 10_000
        attempt_count += 1
        test_board = Scrabble::Board.new(4)
        test_board.add_word("A", 1, "DOG")

        board_as_string = test_board.print_board
        if board_as_string == across
          across_count += 1
        elsif board_as_string == down
          down_count += 1
        end
      end
      max_diff_threshold = 500 # 10_000 * 0.05
      actual_difference = (across_count - down_count).abs

      (actual_difference < max_diff_threshold).must_equal true # assertion
      (across_count + down_count).must_equal attempt_count # assertion
    end

  end

  describe 'add word down' do
    it "adds a word to the board and returns 'true'" do
      word = "MAGGIE"
      test_board = Scrabble::Board.new()
      test_board.add_word("E", 3, "MAGGIE").must_equal word
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
      test_board.add_word("P", 11, "MAGGIE").must_equal "MAGGIE"

      test_board.print_board.slice!(-90..-1).must_equal expected_board_end

      test_board.add_word("A", 16, "HELLO").must_equal "HELLO"
    end

    it "returns 'word' if is forced into a valid position" do
      test_board = Scrabble::Board.new()
      word = "PUDDING"
      test_board.add_word("E", 3, "MAGGIE")
      test_board.add_word("E", 1, word).must_equal word
    end

    it "returns 'word' if is forced to overlap in valid position" do
      test_board = Scrabble::Board.new()
      word = "PUDDING"
      test_board.add_word("P", 11, "MAGGIE").must_equal "MAGGIE"
      test_board.add_word("J", 14, word).must_equal word
    end

    it "returns 'nil' if provided coordinate outside range'" do
      test_board = Scrabble::Board.new()
      assert_raises{test_board.add_word("FOO", 3, "MAGGIE")}
      assert_raises{ test_board.add_word("C", 99, "MAGGIE")}
      assert_raises{ test_board.add_word("C", -1, "MAGGIE")}
      assert_raises{ test_board.add_word("", 12, "MAGGIE")}
      assert_raises{ test_board.add_word(3, 3, "MAGGIE")}
      assert_raises{ test_board.add_word("C", 0, "MAGGIE")}
    end

    it "returns 'nil' if word is not a string'" do
      test_board = Scrabble::Board.new()
      assert_raises{ test_board.add_word("E", 3, :maggie)}
    end

    it "returns 'nil' if word is empty'" do
      test_board = Scrabble::Board.new()
      assert_raises{ test_board.add_word("E", 3, "") }
    end

    it "returns 'nil' if word is contains any spaces'" do
      test_board = Scrabble::Board.new()
      assert_raises{ test_board.add_word("E", 3, "   ")}
      assert_raises{ test_board.add_word("B", 3, "HELLO MAGGIE") }
    end

    it "returns 'nil' if word is contains any non-letters'" do
      test_board = Scrabble::Board.new()
      assert_raises{ test_board.add_word("B", 3, "HELLO,MAGGIE") }
      assert_raises{ test_board.add_word("B", 3, "M4GG1E") }
    end


  end
end
