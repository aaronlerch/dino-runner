require 'gosu'
require_relative 'ground'
require_relative 'player'

class Game < Gosu::Window
    PLAYER_OFFSET = 100

    def initialize(width, height)
        @background_color = Gosu::Color.new 0xffdedede
        @ground = Ground.new 0, height - 5, width, 5
        @player = Player.new PLAYER_OFFSET, 0, 5.0, 5.0
        @player.y = height - @player.height - @ground.height
        super(width, height)
    end

    def button_down(id)
        case id
        when Gosu::KB_ESCAPE
            close
        when Gosu::KB_SPACE
            @player.jump
        else
            super
        end
    end

    def button_up(id)
    end

    def update
        @player.update
        @ground.update
    end

    def draw
        draw_background
        @ground.draw 
        @player.draw
    end

    def draw_background
        draw_rect(
            0, 0,
            width, height,
            @background_color
        )
    end
end