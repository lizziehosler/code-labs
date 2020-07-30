require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game 
    attr_reader :title, :players

    def initialize(title)
        @title = title
        @players = []
    end

    def add_player(player)
        @players.push(player)
    end

    def play(rounds)
        puts "There are #{@players.size} players in #{@title}:"

        @players.each do |player|
            puts player
        end

        treasures = TreasureTrove::TREASURES

        puts "\nThere are #{treasures.size} treasures to be found:"

        treasures.each do |treasure|
            puts "A #{treasure.name} is worth #{treasure.points} points."
        end


        1.upto(rounds) do |round|
            puts "\nRound #{round}:\n"

            @players.each do |player|
                GameTurn.take_turn(player)
            end
        end
    end

    def print_name_and_health(player)
        puts "#{player.name} (#{player.health})"
    end

    def total_points
        @players.reduce(0) do |sum, player|
            sum + player.points
        end
    end
            

    def print_stats
        strong_players = @players.select {|player| player.strong?}
        wimpy_players = @players.reject {|player| player.strong?}

        puts "\n#{@title} Statistics:"

        @players.sort.each do |player|
            puts "\n#{player.name}'s point totals:"
            player.each_found_treasure do |treasure|
                puts "#{treasure.points} total #{treasure.name} points."
            end
            puts "#{player.points} grand total points"
        end

        puts "\n#{strong_players.size} strong players:"
        strong_players.each do |player|
            print_name_and_health(player)
        end
        
        puts "\n#{wimpy_players.size} wimpy players:"
        wimpy_players.each do |player|
            print_name_and_health(player)
        end

        puts "\n#{total_points} total points from treasures found."

        puts "\n#{@title} High Scores:"
        @players.sort.each do |player|
            formatted_name = player.name.ljust(20, '.')
            puts "#{formatted_name} #{player.score}"
        end
    end
end

if __FILE__ == $0
    player = Player.new("moe") 
    knuckleheads = Game.new("Knuckleheads")
    knuckleheads.add_player(player)
    knuckleheads.play
end