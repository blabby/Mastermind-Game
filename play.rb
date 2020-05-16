
class Play
    def initialize
        puts "Please enter size of game:"
        user_size = gets.chomp.to_i
        @code = size(user_size).join("")
        @guesses_remaining = 4
    end

    def size(n)
        array = []
        n.times {array << ["R","G","B","Y"].sample}
        array
    end

    def run
        puts " --------------------------------------- "
        puts "|                                       |"
        puts "|               MASTERMIND              |"
        puts "|                                       |"
        puts " --------------------------------------- "

        guess = "initialize"
        until win?(guess) || lose?
            puts "Enter a code:"
            guess = gets.chomp.upcase
            display(guess)
            @guesses_remaining -= 1
        end
            if @guesses_remaining == 3
        puts "Game Over, you took 1 try."
        else
        puts "Game Over, you took #{4 - @guesses_remaining} tries, and the code was #{@code}"
        end
    end

    def display(guess)
        puts "exact matches: #{exact_match?(guess)}"
        puts "near matches: #{near_match?(guess)}"
        puts "---------------------------------"
    end

    def win?(guess)
        if exact_match?(guess) == @code.length
            puts "YOU WIN!"
            return true
        end
        false
    end

    def lose?
        if @guesses_remaining == 0
            puts "You have lost!"
            return true
        end
        false
    end

    def exact_match?(guess)
        count = 0
        @code.each_char.with_index do |letter, i|
        guess.each_char.with_index do |guess_letter, guess_i|
        if letter == guess_letter && i == guess_i
            count += 1                        
        end
    end
    end
    count
    end

    def near_match?(guess)
        count = 0
        @code.each_char.with_index do |letter, i|
        guess.each_char.with_index do |guess_letter, guess_i|
        if letter == guess_letter && i != guess_i
            count += 1                        
        end
    end
    end
    count
    end
end

Play.new.run