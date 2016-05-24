class Game

  def self.get_input
    print "--What do? >"
    return $stdin.gets.chomp
  end

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.you_died(message = "Your actions have led to Leeroy's death.\n\n")
    puts message
    puts "Leeroy died pursuing what he loved most.\n\nChicken.\n\nGameover, man.\n\n ;_;"
  end

  def initialize
    Game.clear_screen
    puts "============================================================"
    puts "              THE ADVENTURES OF LEEROY JENKINS"
    puts "             Chapter I - The Search for Chicken"
    puts "============================================================"
    puts "You wake up from a deep sleep and realize you are very, very"
    puts "hungry.  You need to find some chicken to eat.\n\n"
    puts "THAT'S THE POINT OF THIS GAME: FIND SOME CHICKEN TO EAT.\n\n"
    SkeletonRoom.new
    true
  end
end

class SkeletonRoom
  def initialize
    @fresh_game = true
    @first_room_key = false
    describe
  end

  def describe
    puts "You are standing in a room of what appears to be a castle,"
    puts "though you can't be sure.  There aren't exactly any windows"
    puts "to see outside, and only one door.  The walls are made of"
    puts "heavy stone blocks, and there is a skeleton still shackled"
    puts "to the wall... so that's probably not a good sign.\n\n"
    @fresh_game = false
    get_action
  end

  def get_action
    choice = Game.get_input

    if choice.include?("search") && !@first_room_key
      @first_room_key = true
      puts "You found a key!  (What a terrible place to hide it...)\n\n"
      describe
    elsif choice.include?("look")
      puts "Sure, I can describe the room again for you... pay close attention.\n\n"
      describe
    elsif choice.include?("search") && @first_room_key
      puts "There doesn't appear to be anything more of interest.\n\n"
      describe
    elsif choice.include?("eat")
      puts "There is nothing to eat here, dude\n\n"
      describe
    elsif choice.include?("door") && !@first_room_key
      puts "The door is LOCKED!\n\n"
      describe
    elsif choice.include?("door") && @first_room_key
      puts "The tumblers fall into place and the door swings open!"
      puts "You step into the next room...\n\n"
      ChickenRoom.new
    elsif choice.include?("die")
      Game.you_died("WTF, dude?")
    else
      puts "Sorry, I have no idea what you're talking about. Maybe try rephrasing?\n\n"
      describe
    end
  end
end

class ChickenRoom
  def initialize
    Game.clear_screen
    puts "You enter a room full of freshly prepared chicken!"
    puts "You don't know how it got here - no one does! IT'S MAGIC CHICKEN!"
    puts "But who are you to second-guess free chicken? It smells DELICIOUS."
    end_game
  end

  def end_game
    Game.clear_screen
    puts "Congratulations!  Leeroy found the magic chicken in the, um... castle."
    puts "So he gets to eat some chicken, I guess.  HOORAY!"
    puts "YOU WIN THE GAME.\n\n"
  end
end