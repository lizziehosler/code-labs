class Player

    attr_reader :health
    attr_accessor :name

    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end

    def score
        @health + @name.length
    end

    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}."
    end

    def blam
        @health -= 10
        puts "#{@name} got blammed!"
    end

    def w00t
        @health += 15
        puts "#{@name} got w00ted!"
    end

end

class Game 
    attr_reader :title

    def initialize(title)
        @title = title
        @players = []
    end

    def add_player(player)
        @players.push(player)
    end

    def play
        puts "There are #{@players.size} players in #{@title}."

        @players.each do |x|
            puts x
        end

        @players.each do |x|
            x.blam
            x.blam
            x.w00t
            puts x
        end
    end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play
