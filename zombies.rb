# Authors: Késsia Castro and Luciano Eduardo
# Introduction to Programming - IFRN - 2014

class Zombie
  attr_reader :x, :y, :alive, :z, :shooting
  attr_accessor :score

  def initialize(game_window)
  	@game_window = game_window
  	@idle = Gosu::Image.load_tiles(@game_window, "imagens/sprite_zombies_64x64.png", 64, 64, true)
  	@x = rand(1..463)
  	@y = 0
    @z = 0
    @frame = 0
    @alive = true
  end

 def update(bullet)
    @frame += 0.4
    if @y > 536 and z == 0
      @game_window.close
    else
    @y = @y + 0.9
    end
    hit_by?(bullet)
  end

  def draw
    f = @frame % @idle.size
    image = @idle[f]
  	image.draw(@x, @y, 1)
  end

  def hit_by?(bullet)
    if bullet.z == @z and bullet.shooting == true then
      if Gosu::distance(bullet.y, bullet.x, @y, @x) < 64
        @alive = false
        @game_window.score +=1
        bullet.shooting = false
        bullet.alive = false
        @z = -64
      end
    end
  end
end