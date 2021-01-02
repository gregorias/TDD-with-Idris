data Direction = North
               | East
               | South
               | West

turnClockwise : Direction -> Direction
turnClockwise North = East
turnClockwise East = South
turnClockwise South = East
turnClockwise West = North
