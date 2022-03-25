require 'gosu'

class Ground
    attr_accessor :x, :y
    attr_reader :width, :height

    def initialize(x, y, width, height)
        @color = Gosu::Color.new 0xff555555
        @x = x
        @y = y
        @height = height
        @width = width
    end

    def update
    end

    def draw
        Gosu.draw_rect(
            @x, @y,
            @width, @height,
            @color
        )
    end
end