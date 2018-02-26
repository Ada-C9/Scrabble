# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/board'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'board' do
  describe 'initialize' do
    it 'creates a board' do
      test_board = Scrabble::Board.new()
      test_board.must_be_kind_of Scrabble::Board
      test_board.must_respond_to :size
      test_board.size.must_equal 16
    end

    it 'creates boards of valid sizes' do
      test_board_3 = Scrabble::Board.new(3)
      test_board_3.must_be_kind_of Scrabble::Board
      test_board_3.size.must_equal 3

      test_board_max = Scrabble::Board.new(26)
      test_board_max.must_be_kind_of Scrabble::Board
      test_board_max.size.must_equal 26

      test_board_min = Scrabble::Board.new(1)
      test_board_min.must_be_kind_of Scrabble::Board
      test_board_min.size.must_equal 1
    end

    it 'only creates a board if the values are integers > 0' do
      proc { Scrabble::Board.new(-3) }.must_raise ArgumentError
      proc { Scrabble::Board.new(0) }.must_raise ArgumentError
      proc { Scrabble::Board.new("breaking your code") }.must_raise ArgumentError
    end
  end

  describe 'get_board' do
    it 'returns the string output of the board' do
      test_board = Scrabble::Board.new()
      line =  "----" * 16
      row =  "\n#{"|   " * 16}|\n"
      whole_board = "#{"#{line}#{row}" * 16}#{line}"
      test_board.get_board.must_equal whole_board

      # Reference for board:
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
      #
      # Note: this should only be used to reference places on the default board.
      # An actual board does not print with numbers and letters due to poor
      # planning and a reluctance to suffer additional psychological trauma
      # brought on by making changes to the board as a String and retesting it.
    end

    it 'adjusts for different board sizes' do
      test_board = Scrabble::Board.new(3)
      line = "------------"
      row = "\n|   |   |   |\n"
      whole_board = "#{line}#{row}#{line}#{row}#{line}#{row}#{line}"

      test_board.get_board.must_equal whole_board
    end

    it 'gets min board' do
      baby_board = Scrabble::Board.new(1)
      expected_baby_board = "----\n|   |\n----"
      baby_board.get_board.must_equal expected_baby_board
    end

    it 'prints correctly when overlapping' do
      test_board = Scrabble::Board.new(4)
      test_board.add_word("C", 2, "DOG")
      test_board.add_word("A", 3, "LOOP")
      # ----------------
      # |   |   | L  |  |
      # ----------------
      # |   |   | O |   |
      # ----------------
      # |   | D | O | G |
      # ----------------
      # |   |   | P |   |
      # ----------------
      line = "----------------"
      row_a = "\n|   |   | L |   |\n#{line}"
      row_b = "\n|   |   | O |   |\n#{line}"
      row_c = "\n|   | D | O | G |\n#{line}"
      row_d = "\n|   |   | P |   |\n#{line}"
      expected_board ="#{line}#{row_a}#{row_b}#{row_c}#{row_d}"
      test_board.get_board.must_equal expected_board
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

      board_as_string = test_board.get_board
      # 50/50 chance on which was it turns down if can fit either way
      is_equal = board_as_string == down || board_as_string == across
      is_equal.must_equal true
    end

  end

  # Return word == it was added. Return 'nil' == it wasn't added.
  describe 'add_word' do
    it 'adds a word to the board and returns word' do
      word = "MAGGIE"
      test_board = Scrabble::Board.new()
      test_board.add_word("E", 3, "MAGGIE").must_equal word
    end

    it 'add word to min board' do
      baby_board = Scrabble::Board.new(1)
      baby_board.add_word("A", 1, "A").must_equal "A"
      expected_baby_board = "----\n| A |\n----"
      baby_board.get_board.must_equal expected_baby_board
    end

    it 'adds a word even if lowercase' do
      test_board = Scrabble::Board.new()
      test_board.add_word("E", 3, "maggie").must_equal "MAGGIE"
    end

    it 'switches at random' do
      # Prints the same thing a 'get_board -> adds letters correctly' test
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

        board_as_string = test_board.get_board
        if board_as_string == across
          across_count += 1
        elsif board_as_string == down
          down_count += 1
        end
      end

      # There's a chance this could fail despite the program working correctly,
      # but it's highly improbable. 10_000 was chosen to reduce this chance.
      max_diff_threshold = 500 # 10_000 * 0.05 (statistically significant)
      actual_difference = (across_count - down_count).abs

      (actual_difference < max_diff_threshold).must_equal true
      (across_count + down_count).must_equal attempt_count # all are matches
    end

    it 'returns word if is forced along board edge' do
      test_board = Scrabble::Board.new()
      test_board.add_word("P", 11, "MAGGIE").must_equal "MAGGIE"
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
      test_board.get_board.slice!(-90..-1).must_equal expected_board_end
    end

    it 'returns word if forced into a valid position' do
      test_board = Scrabble::Board.new()
      test_board.add_word("E", 3, "MAGGIE") # either prints across or down
      test_board.add_word("E", 1, "PUDDING").must_equal "PUDDING" # forced down
    end

    it 'returns word if forced to overlap in valid position' do
      test_board = Scrabble::Board.new()
      test_board.add_word("P", 11, "MAGGIE").must_equal "MAGGIE"
      test_board.add_word("J", 14, "PUDDING").must_equal "PUDDING" # 'G' overlap
    end

    it 'throws ArgumentError if provided invalid' do
      test_board = Scrabble::Board.new()
      proc { test_board.add_word("AA", 3, "MAGGIE") }.must_raise ArgumentError
      proc { test_board.add_word("C", 17, "MAGGIE") }.must_raise ArgumentError
      proc { test_board.add_word("C", "5", "MAGGIE") }.must_raise ArgumentError
      proc { test_board.add_word("C", -1, "MAGGIE") }.must_raise ArgumentError
      proc { test_board.add_word("", 12, "MAGGIE") }.must_raise ArgumentError
      proc { test_board.add_word("Q", 12, "HI") }.must_raise ArgumentError
      proc { test_board.add_word(3, 3, "MAGGIE") }.must_raise ArgumentError
      proc { test_board.add_word("C", 0, "MAGGIE") }.must_raise ArgumentError
    end

    it 'throws ArgumentError if word is not a string' do
      test_board = Scrabble::Board.new()
      proc { test_board.add_word("E", 3, :maggie) }.must_raise ArgumentError
    end

    it 'throws ArgumentError if word is beyond max in length' do
      test_board = Scrabble::Board.new()
      proc { test_board.add_word("E", 1, "MAGGIEEE") }.must_raise ArgumentError
    end

    it 'throws ArgumentError if word is empty' do
      test_board = Scrabble::Board.new()
      proc { test_board.add_word("E", 3, "") }.must_raise ArgumentError
    end

    it 'throws ArgumentError if word is contains any spaces' do
      test_board = Scrabble::Board.new()
      proc { test_board.add_word("E", 3, "   ") }.must_raise ArgumentError
      proc { test_board.add_word("B", 3, " MAGGIE") }.must_raise ArgumentError
    end

    it 'throws ArgumentError if word is contains any non-letters' do
      test_board = Scrabble::Board.new()
      proc { test_board.add_word("B", 3, "HELLO!") }.must_raise ArgumentError
      proc { test_board.add_word("B", 3, "M4GG1E") }.must_raise ArgumentError
    end

  end
end
