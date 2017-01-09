# Authors: Késsia Castro and Luciano Eduardo
# Introduction to Programming - IFRN - 2014

class Bullet
    attr_reader :x, :y
    attr_accessor :shooting, :z, :alive, :bulletalive
    def initialize(player, game_window)
        @player = player
        @game_window = game_window
        @shooting = false
        @x = @player.x+50
        @y = @player.y
        @z = 0
        @icon = Gosu::Image.new(@game_window, "imagens/bullet_25x12.png", true)
        @alive = true
    end
    
    def shoot
        @shooting = true
    end
    def update
        if @shooting
            @y = @y - 10
            if @y < 0
                @shooting = false
            end
        else
            @x = @player.x+50
            @y = @player.y
        end
    end
    
    def draw
        if @shooting
            @icon.draw(@x, @y, 1)
        end
    end
end