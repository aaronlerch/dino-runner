require 'gosu'

class Player
    def initialize(scale_x = 1.0, scale_y = 1.0)
        animation_time_in_seconds = 0.1
        # load_tiles(source, width, height, options)
        @frames = Gosu::Image.load_tiles "assets/dino-tiles.png", 15, 19, { retro: true }
        @time = animation_time_in_seconds * 1000
        @scale_x = scale_x
        @scale_y = scale_y
    end

    def update
        @frame = @frames[Gosu::milliseconds / @time % @frames.length]
    end

    def draw(x, y, z)
        @frame.draw x, y, z, @scale_x, @scale_y
    end
end