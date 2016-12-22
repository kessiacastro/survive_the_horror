# Autors: Késsia Castro and Luciano Eduardo
# Introduction to Programming - IFRN - 2014

class MyGame < Gosu::Window
attr_reader :score
attr_accessor :score, :bulletalive

	def initialize
		super(600, 600, false)
		@player = Player.new(self)
		@background_image = Gosu::Image.new(self, "imagens/background/background_zombies.png", true)
		@zombies = 2.times.map {Zombie.new(self)}
		@timer = Timer.new(self, @zombies)
        @bulletdead = []
        @bulletalive = []
        @score = 0
        @font = Gosu::Font.new(self, 'Courier', 40)
	end

	def update
		
        def game_over(player)
            @player = player
            if player.game_over == true then
                self.close
            end
        end
        
		def button_down(id)
    		if id == Gosu::KbLeft
      		@player.move_left
			elsif id == Gosu::KbRight
			@player.move_right
            end	
		end
		@player.update
		@zombies.each {|zombie| zombie.update(@player.bullet)}
        @timer.update
    end

  

    def run_game
        live_zombies.each {|zombie| zombie.update(@player.bullet)}        
        @player.update
        @timer.update
    end
    
    def live_zombies
        @zombies.select {|zombie| zombie.alive == true}
    end

    def dead_bullets
    	if bullet.alive == false then
    		bulletdead << bullet
    	end
    	for bullet in bulletdead do
    		bullet.z = -64
    	end
    end

	def draw
		@player.draw
		live_zombies.each {|zombie| zombie.draw}
		@background_image.draw(0, 0, 0)
        @font.draw("#{@score}", 10, 10, 20)
	end
end

