class Map
  def initialize
    @rooms = [ SkeletonRoom, SilverfishRoom, TreasureRoom, WispRoom, OgreRoom, ChapelRoom ]
  end

  def play
    @rooms = @rooms.shuffle
    @rooms.each do |room|
      room.new.play
      Game.clear_screen
    end
    ChickenRoom.new.play 
  end
end
