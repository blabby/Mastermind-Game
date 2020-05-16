class Size
    attr_reader :game_size
    def initialize
        puts "Enter a game size:"
        @game_size = gets.chomp.to_i
    end
end