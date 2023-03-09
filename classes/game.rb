require "players.rb"
require "questions.rb"

class Game

    def initialize
        @players = []
      end
    
    def start
        puts "Get your calculators ready!"

        print "Player 1, your name?"
        player_1 = Player.new(gets.chomp)
        @players << player_1

        print "Player 2?"
        player_2 = Player.new(gets.chomp)
        @players << player_2

        puts "#{Player_1.name}, you're up first!"
        question = Question.new
        puts question.question_string
        player_answer = $stdin.gets.chomp.to_s

        if player_answer == question.answer.to_s
            puts "Correct"
            puts "#{player_1.name}: " + @player_1.lives.to_s + "/3, #{player_2.name}: " + @player_2.lives.to_s + "/3"
        else 
            puts "That ain't right"
            player_1.lose_life
            puts "#{player_1.name}: " + @player_1.lives.to_s + "/3, #{player_2.name}: " + @player_2.lives.to_s + "/3"
        end
        player_2_turn
    end

    def player_2_turn
    end

    def player_1_turn
    end
end