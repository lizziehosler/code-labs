require_relative 'player'
require_relative 'game_turn'

class Game 
    attr_reader :title, :players

    def initialize(title)
        @title = title
        @players = []
    end

    def add_player(player)
        @players.push(player)
    end

    def play
        puts "There are #{@players.size} players in #{@title}:"

        @players.each do |player|
            puts player
        end

        @players.each do |player|
            GameTurn.take_turn(player)
            puts player
        end
    end
end

if __FILE__ == $0
    player = Player.new("moe") #example code from player.rb
    knuckleheads = Game.new("Knuckleheads")
    knuckleheads.add_player(player)
    knuckleheads.play
end