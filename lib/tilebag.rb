class TileBag
  attr_accessor :tile_bag

  def initialize
    @tile_bag = {
      A: 9,
      B: 2,
      C: 2,
      D: 4,
      E: 12,
      F: 2,
      G: 3,
      H: 2,
      I: 9,
      J: 1,
      K: 1,
      L: 4,
      M: 2,
      N: 6,
      O: 8,
      P: 2,
      Q: 1,
      R: 6,
      S: 4,
      T: 6,
      U: 4,
      V: 2,
      W: 2,
      X: 1,
      Y: 2,
      Z: 1
    }
  end

  def draw_tiles(num)
    # num = 7 - Player.tiles.length
    #the player class inherits from TileBag class so they can super this method?
    #num in this method might be passed from the player draw_tiles(tile_bag) method with (7 - current number of tiles player has (i.e. tiles.length))

    drawn_tiles = @tile_bag.to_a.sample(num)

    drawn_tiles.each do |letter_frequency|
      print letter_frequency[0]
      @tile_bag[letter_frequency[0]] -=1
    end

    return drawn_tiles
  end

  def tiles_remaining
    #https://apidock.com/ruby/Enumerable/inject
    #returns # of tiles remaining in bag (current number of tiles in default_tiles)
    #adding up the value for each letter in @tile_bag
    @tile_bag.inject(0) do |sum, (letter, frequency)|
      sum + frequency
    end
  end
end

game_1_tiles = TileBag.new
game_1_tiles.draw_tiles(7)
puts game_1_tiles.tile_bag
# game_1_tiles.draw_tiles(7)
# puts game_1_tiles.tile_bag
# game_1_tiles.draw_tiles(7)
# puts game_1_tiles.tile_bag
# game_1_tiles.draw_tiles(1)
puts game_1_tiles.tiles_remaining
