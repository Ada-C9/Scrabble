require 'awesome_print'

module Scrabble
  class Tilebag
    attr_reader :tiles, :drawn_tiles

    def initialize
      @tiles = %w[
        a a a a a a a a a
        b b
        c c
        d d d d
        e e e e e e e e e e e e
        f f
        g g g
        h h
        i i i i i i i i i
        j
        k
        l l l l
        m m
        n n n n n n
        o o o o o o o o
        p p
        q
        r r r r r r
        s s s s
        t t t t t t
        u u u u
        v v
        w w
        x
        y y
        z
      ]
    end

    def draw_tiles(number)
      drawn_tiles_array = Array.new
      number.times do
        index = rand(@tiles.length)
        drawn_tiles_array << @tiles[index]
        @tiles.delete_at(index)
      end

        return drawn_tiles_array


    def draw_tiles(num)
      @drawn_tiles = @tiles.sample(num)
      @tiles.delete(@drawn_tiles)

      return @drawn_tiles
    end

    def tiles_remaining
     @tiles.length - @drawn_tiles.length
    end

  end
end
