require_relative "players"
require_relative "questions"

class Game

    def initialize
        @players = []
        # @player_1 = Player.new(gets.chomp)
        # @player_2 = Player.new(gets.chomp)
      end
      def start
        puts "Get your calculators ready!"

        print "Player 1, your name? "
        @player_1 = Player.new(gets.chomp)
        # @players << player_1

        print "Player 2? "
        @player_2 = Player.new(gets.chomp)
        # @players << player_2

        puts "#{@player_1.name}, you're up first!"
        question = Question.new
        puts question.question_string
        player_answer = $stdin.gets.chomp.to_s

        if player_answer == question.answer.to_s
            puts "Correct"
            puts "#{@player_1.name}: " + "#{@player_1.lives} + /3, #{@player_2.name}:"  + "#{@player_2.lives} + /3"
        else 
            puts "That ain't right"
            @player_1.lose_life
            puts "#{@player_1.name}: " + "#{@player_1.lives} + /3, #{@player_2.name}:"  + "#{@player_2.lives} + /3"
        end
        player_2_turn
    end
    
      def player_2_turn

        puts "---Next Round---"
        puts "#{@player_2.name}: "
        question = Question.new
        puts question.question_string
        player_answer = $stdin.gets.chomp.to_s

        if player_answer == question.answer.to_s
            puts "Correct"
            puts "#{@player_2.name}: " + @player_2.lives.to_s + "/3, #{@player_1.name}: " + @player_1.lives.to_s + "/3"
        else 
            puts "That ain't right"
            @player_2.lose_life
            puts "#{@player_2.name}: " + @player_2.lives.to_s + "/3, #{@player_1.name}: " + @player_1.lives.to_s + "/3"
        end
        if @player_1.lives.to_s == "0"
            puts "Winner is player 2 with a score of #{@player_2.lives.to_s}/3"
            exit(0)
        elsif @player_2.lives.to_s == "0"
            puts "Winner is player 1 with a score of #{@player_1.lives.to_s}/3"
            exit(0)
        end
        player_1_turn
    end

    def player_1_turn
        puts "---Next Round---"
        question = Question.new
        puts question.question_string
        player_answer = $stdin.gets.chomp.to_s

        if player_answer == question.answer.to_s
            puts "Correct"
            puts "#{@player_1.name}: " + "#{@player_1.lives}/3, #{@player_2.name}: "  + "#{@player_2.lives}/3"
        else 
            puts "That ain't right"
            @player_1.lose_life
            puts "#{@player_1.name}: " + "#{@player_1.lives}/3, #{@player_2.name}: "  + "#{@player_2.lives}/3"
        end

        if @player_1.lives == 0
            puts "Winner is player 2 with a score of #{@player_2.lives}/3"
            exit(0)
        elsif @player_2.lives == 0
            puts "Winner is player 1 with a score of #{@player_1.lives}/3"
            exit(0)
        end
        player_2_turn
    end
    

end