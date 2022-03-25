require 'gosu'
require_relative 'player'

class Game < Gosu::Window
    def initialize(width, height)
        @background_color = Gosu::Color.new 0xffdedede
        @player = Player.new 5.0, 5.0
        super(width, height)
    end

    def button_down(id)
        if id == Gosu::KB_ESCAPE
            close
        else
            super
        end
    end

    def button_up(id)
    end

    def update
        @player.update
    end

    def draw
        draw_background
        @player.draw 50, 50, 1
    end

    def draw_background
        draw_rect(
            0, 0,
            width, height,
            @background_color
        )
    end
end