class Player
	attr_reader :x, :y, :z, :bullet, :game_over
	def initialize(game_window)
		@game_window = game_window
		@soldier = Gosu::Image.new(@game_window, "imagens/soldado_player.png", true)
		@y = 500
		@x = 1
		@z = 0
		@bullet = Bullet.new(self, @game_window)
		@game_over = false
	end


	def move_left
		if @x <  64
			@x = 1
		else
			@x = @x - 66
		end
	end


	def move_right
		if @x >  463
			@x = 529
		else
			@x = @x + 66
		end
	end


	def draw
		@soldier.draw(@x, @y, 1)
		@bullet.draw
	end

	def update
		if @game_window.button_down? Gosu::Button::KbSpace
			@bullet.shoot
		end
		@bullet.update
		
	end
	def hit_by?(zombie)
        if Gosu::distance(zombie.y, zombie.x, @y, @x) < 64
           @game_over = true
        end
 
    end
end