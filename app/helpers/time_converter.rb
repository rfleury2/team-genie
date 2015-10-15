module TimeConverter
	def self.call(game_time)
		puts game_time
		DateTime.new(game_time["time(1i)"].to_i, game_time["time(2i)"].to_i, game_time["time(3i)"].to_i, game_time["time(4i)"].to_i, game_time["time(5i)"].to_i)
	end
end