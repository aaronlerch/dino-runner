require 'gosu'

class Player
    attr_accessor :x, :y
    attr_reader :width, :height, :state

    def initialize(x, y, scale_x = 1.0, scale_y = 1.0)
        h = 19
        w = 15
        animation_time_in_seconds = 0.1

        # load_tiles(source, width, height, options)
        @frames = Gosu::Image.load_tiles "assets/dino-tiles.png", w, h, { retro: true }
        @time = animation_time_in_seconds * 1000
        @x = x
        @y = y
        @scale_x = scale_x
        @scale_y = scale_y

        @height = h * scale_y
        @width = w * scale_x
        
        @state = :running
    end

    def jump
        @state = :jumping
    end

    def update
        if @state == :jumping
            @frame = @frames[1]
        else
            @frame = @frames[Gosu::milliseconds / @time % @frames.length]
        end
    end

    def draw
        @frame.draw @x, @y, 0, @scale_x, @scale_y
    end
end