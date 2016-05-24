class ChapelRoom
   
    def initialize()
        @reward = false
        describe
    end
    
    def describe
        puts "You stand in a small dark room with dimly lit candles illimunating"
        puts "just the basic features of the room. Upon closer inspection, you"
        puts "realize this room is a small chapel. In the dark corner of the room"
        puts "you notice as shadow figure as the sound of wimpering.  In the other"
        puts "corner, you notice a door lying half open leading to what appear to"
        puts "be the outside.\n\n"
        get_action
    end
    
    def get_action
        choice = Game.get_input

        if choice.include?("search") && !@reward
            @first_room_key = true
            puts "There is nothing of interest to search.  Would you like to"
            puts "approach the shadowy figure?\n\n"
            search_action
        elsif choice.include?("search") && @reward
            puts "There is nothing else of interest to search. \n\n"
            describe
        elsif choice.include?("look")
            puts "Sure, I can describe the room again for you... pay close attention.\n\n"
            describe
        elsif choice.include?("eat")
            puts "There is nothing to eat here, dude\n\n"
            describe
        elsif choice.include?("door") && !@reward
            puts "You walk out the door, stepping into the freedom of the outside world."
            puts "You may not have found the chicken you were seeking, but at least you"
            puts "made it out with your life.\n\n"
        elsif choice.include?("door") && @reward
            puts "You walk out the door, stepping into the freedom of the outside world."
            puts "You may not have found the chicken you were seeking, but you aquired"
            puts "something even better, the Devout Shoulders of the gods!"
            puts "YOU WIN THE GAME.\n\n"
        elsif choice.include?("die")
            Game.you_died("WTF, dude?")
        else
            puts "Sorry, I have no idea what you're talking about. Maybe try rephrasing?\n\n"
            describe
        end
    end
    
    def search_action
        choice = Game.get_input
        
        if choice.include?("yes")
            puts 'Upon approaching the shadowy figure, you notice it is actually an old man.'
            puts 'The old man congratulates you "Congratulations on making it this far, take'
            puts 'this as a reward".  The old man hands you the legendary Devout Shoulders of'
            puts "the gods.\n\n"
            @reward = true;
            describe
        elsif choice.include?("no")
            puts "You ignore the shadowy figure.\n\n"
            describe
        else
            puts "Sorry, I have no idea what you're talking about. Maybe try rephrasing?\n\n"
            describe
        end
    end
    
    
end
