# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

module Scrabble
  class Board

    attr_reader :size

    def initialize(dimensions = 16)
      @size = 0 # number of squares down and across the board is
      @board = create_board(dimensions)
    end

    # Returns String represents of current board.
    def get_board
      return board_to_string
    end

    # Throws ArgumentError if provided word is not a String that contains one or
    # more letters, contains only letters, and is no more than MAX_LETTERS in
    # length or if row or column are invalid or outside the board's boundaries.
    #
    # Returns word if word is successfully added to board, with the first letter
    # of word placed on the board at square at row and column location.
    # Otherwise, returns 'nil'.
    #
    # @param  row   String ('A' - last row's letter), row of word's first letter
    # @param  column  int (1 - board's size), column of word's first letter
    def add_word(row, column, word)
      valid_word_or_error(word)
      valid_coordinates_or_error(row, column)
      return add_to_board_if_able(row, column, word.upcase)
    end

    private

    # Returns board as a String.
    #
    # Example of empty board of size 2:
    # '--------\n|   |   |\n--------\n|   |   |\n--------'
    def board_to_string
      board_as_string = "----" * @size
      @board.each do |columns|
        row = "\n"
        columns.each do |element|
          element = " " if element.nil? # keeps alignment
          row = "#{row}| #{element} "
        end
        board_as_string << "#{row}|\n#{"----" * @size}"
      end
      return board_as_string
    end

    # Throws ArgumentError if provided word is not a String that contains one or
    # more letters, contains only letters, and is no more than MAX_LETTERS in
    # length.
    def valid_word_or_error(word)
      if word.class != String || !word.length.between?(1, MAX_LETTERS) ||
        word.upcase.match?(/[^A-Z]+?/)
        raise ArgumentError.new("#{word} must be a String with only letters.")
      end
    end

    # If word fit starting at row and col, adds word to board and returns word.
    # Otherwise, returns 'nil'.
    def add_to_board_if_able(row, col, word)
      row = row.upcase.ord - "A".ord  # must convert row letter to index
      col -= 1 # board starts at 1 from user's perspective
      if col + word.length <= @size && row + word.length <= @size
        return insert_across_or_down(row, col, word) # might fit across or down
      elsif  col + word.length <= @size
        return insert_across(row, col, word) # might fit across but not down
      elsif row + word.length <= @size
        return insert_down(row, col, word) # might fit down but not across
      end
    end

    # Returns word if word is able to fit on the board, with the first letter of
    # word at row and col position on board. Otherwise, returns 'nil'.
    def insert_across_or_down(row, col, word)
      if rand(0..1) == 0 # Randomly picks a place to start
        return word if !insert_across(row, col, word).nil?
        return word if !insert_down(row, col, word).nil?
      else
        return word if !insert_down(row, col, word).nil?
        return word if !insert_across(row, col, word).nil?
      end
    end

    # If word fits across on board starting at row and col without writing over
    # non-matching letters already on board, adds word to board and returns
    # word. Otherwise, returns 'nil'.
    def insert_across(row, col, word)
      return if !has_space_across_for_word?(row, col, word)
      (0...word.length).each { |index| @board[row][col + index] = word[index] }
      return word
    end

    # Returns word if word fits across on board starting at row and col without
    # writing over non-matching letters already on board. Otherwise, returns
    # 'nil'
    def has_space_across_for_word?(row, col, word)
      @board[row][col...word.length].each_with_index do |board_space, index|
        return if !board_space.nil? && board_space != word[index]
      end
      return word
    end

    # If word fits down on board starting at row and col without writing over
    # non-matching letters already on board, set word in board and returns word.
    # Otherwise, returns 'nil'.
    def insert_down(row, col, word)
      return if !has_space_down_for_word?(row, col, word)
      (0...word.length).each { |index| @board[row + index][col] = word[index] }
      return word
    end

    # Returns word if word fits down on board starting at row and col without
    # writing over non-matching letters already on board. Otherwise, returns
    # 'nil'
    def has_space_down_for_word?(row, col, word)
      word.length.times do |index|
        board_space = @board[row + index][col]
        return if !board_space.nil? && board_space != word[index]
      end
      return word
    end

    # Throws ArgumentError if row and column are not valid positions on board.
    def valid_coordinates_or_error(row, column)
      if !is_valid_row_coordinate?(row) || !is_valid_column_coordinate?(column)
        raise ArgumentError.new("Invalid coordinate(s) #{row} and/or #{column}")
      end
    end

    # Returns 'true' if provided row is a an String with size 1 and is a letter
    # between 'A' and the max row letter of board (inclusive). Otherwise,
    # returns 'false'.
    def is_valid_row_coordinate?(row)
      return row.class == String && row.upcase.between?("A", last_row_letter) &&
        row.size == 1
    end

    # Returns the letter that represents the last row.
    def last_row_letter
      return (65 + @size - 1).chr # 'A' + ord. of last letter
    end

    # Returns 'true' if provided column is a an int with value between 1 and
    # board's size (inclusive). Otherwise, return 'false'.
    def is_valid_column_coordinate?(column)
      return column.class == Integer && column.between?(1, @size)
    end

    # Pre: Throws ArgumentError if dimensions is not an int or has a value less
    # than 1 or greater than 26.
    #
    # Sets size to dimensions and returns new board based on dimensions, which
    # are the number of squares the board is across and down.
    #
    # A board with dimensions of 4:
    #   ----------------
    #   |   |   |   |   |
    #   ----------------
    #   |   |   |   |   |
    #   ----------------
    #   |   |   |   |   |
    #   ----------------
    #   |   |   |   |   |
    #   ----------------
    def create_board(dimensions)
      check_initial_dimension(dimensions)
      @size = dimensions
      return Array.new(dimensions) { Array.new(dimensions) }
    end

    # Throws ArgumentError if dimensions is not an int or has a value less than
    # 1 or greater than 26.
    def check_initial_dimension(dimensions)
      if dimensions.class != Integer || !dimensions.between?(1, 26)
        raise ArgumentError.new("Initial dimensions must be 1 and 26.")
      end
    end

  end
end
