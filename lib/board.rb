module Scrabble
  class Board

    attr_reader :size

    def initialize(dimensions = 16 )
      @size = 0
      @board = create_board(dimensions)
    end

    def print_board
      board_as_string = "----" * @size
      @board.each do |columns|
        row = "\n"
        columns.each do |element|
          element = " " if element.nil? # keeps alignment
          row = "#{row}| #{element} "
        end
        board_as_string << "#{row}|\n#{"----" * @size}"
        # board_as_string = "#{board_as_string}#{row}|\n#{"----" * @board.length}"
      end
      return board_as_string
    end

    def add_word(coordinates, word) #test if not a word
      return if !is_valid_word?(word)
      coordinates = convert_to_indices_if_valid(coordinates)
      return if coordinates.nil?
      return fit_if_valid(coordinates, word)
      # fits_down?(coordinates, word)
    end

    private

    def is_valid_word?(word)
      return word.class == String && word.length > 0 && !word.upcase.match?(/[^A-Z]+?/)
    end

    def fit_if_valid(coordinates, word)
      row, col = coordinates[0..1]
      return if col + word.length > @size && row + word.length > @size
      if col + word.length < @size #&&  col + word.length > @size
        return !fits_across(row, col, word).nil?
      end
    end

    def fits_across(row, col, word)
      return if @board[row][col...word.length].any? {|index| !index.nil? }
      (0...word.length).each { |index| @board[row][col+ index] = word[index] }
      return word
    end

    def convert_to_indices_if_valid(coordinates)
      return if coordinates.class != Array || coordinates.size != 2
      coordinates.each_with_index do |coordinate, index|
        return if !is_valid_coordinate?(coordinate)
        coordinates[index] -= 1
      end
      return coordinates
    end

    def is_valid_coordinate?(coordinate)
      return coordinate.class == Integer && coordinate.between?(1, @size)
    end

    # Throws ArgumentError if provided dimensions are not a positive number.
    # Otherwise, creates new
    def create_board(dimensions)
      check_initial_dimension(dimensions)
      @size = dimensions
      return Array.new(dimensions) { Array.new(dimensions) }
    end

    # Throws ArgumentError if provided dimensions are not a positive number.
    def check_initial_dimension(dimensions)
      if dimensions.class != Integer || dimensions < 1
        raise ArgumentError.new("Initial dimensions must be a positive number.")
      end
    end

  end
end
