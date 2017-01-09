# Authors: Késsia Castro and Luciano Eduardo
# Introduction to Programming - IFRN - 2014

class Timer
	def initialize(window, zombies)
		@window = window
		@zombies = zombies
		@start_time = Time.now
		@every_n_seconds = 3
		@last_recorded_seconds = 0
		@time = Time.now
	end
	
	def update
		if (add_zombies?) then
			@zombies << Zombie.new(@window)
		end
		if seconds == 600 then
			@game_window.close
		end
		if seconds == 10 then
			@every_n_seconds = 1
		end
	end
	def seconds
		(Time.now-@start_time).to_i
	end

	def add_zombies?
		if seconds != @last_recorded_seconds and seconds % @every_n_seconds == 0
			@last_recorded_seconds = seconds
			true
		else
			false
		end
	end
end