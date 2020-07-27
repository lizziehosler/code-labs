require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'

module GameTurn
    def self.take_turn(player)
        die = Die.new
        case die.roll
        when 1..2
            player.blam
        when 3..4
            puts "#{player.name} was skipped."
        else
            player.w00t
        end
        treasure_found = TreasureTrove.random
        puts "#{player.name} found a #{treasure_found.name} worth #{treasure_found.points} points."
    end
end
