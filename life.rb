def countNeighbours cellX, cellY, board
    possibX = []
    possibY = []
    co = 0
    if cellX == 0
        possibX = [(board.length - 1), cellX, (cellX + 1)]
    elsif cellX == (board.length - 1)
        possibX = [(cellX - 1), cellX, 0]
    else
        possibX = [(cellX - 1), cellX, (cellX + 1)]
    end
    
    if cellY == 0
        possibY = [(board.length - 1), cellY, (cellY + 1)]
    elsif cellY == (board.length - 1)
        possibY = [(cellY - 1), cellY, 0]
    else
        possibY = [(cellY - 1), cellY, (cellY + 1)]
    end
    
    for i in 0..((board.length**2)-1)
        co += (board[possibY[i]][possibX[i%board.length]] ? 1 : 0)
    end
    #co = ((board[board.length-celllY][cellX] ? 1 : 0) + 
    
    return co 
end

def defFate cellX, cellY, board
    neighbours = countNeighbours(cellX, cellY, board)
    puts "Neighbours: " + neighbours.to_s
    if board[cellY][cellX]
        if neighbours < 2 or neighbours > 3
            fate = false
        else
            fate = true
        end
    else
        if neighbours == 3
            fate = true
        else
            fate = false
        end
    end
    return fate
end

puts "Conway's Game of Life"
print "Board size? "
sized = gets.chomp.to_i
gameBoard = Array.new(sized) { Array.new(sized) { false } }
while true
    nextBoard = gameBoard
    repBoard = Array.new(sized) { Array.new(sized) { "_" } }
    print "Command: " 
    cmd = gets.chomp.downcase
    case cmd
    when "step"
        for i in (0..((gameBoard.length**2)-1))
            nextBoard[i][i%gameBoard.length] = defFate((i%gameBoard.length), i, gameBoard)
            repBoard[i][i%gameboard.length] = (nextBoard[i][i%gameBoard.length] ? "#" : "_")
        end
        for k in (0..((gameBoard.length**2)-1))
            #print nextBoard[k]
            print repBoard[k]
            puts
        end
        gameBoard = nextBoard
        puts
    when "edit"
        print "X: "
        x = (gets.chomp.to_i - 1)
        print "Y: "
        y = (gets.chomp.to_i - 1)
        gameBoard[y][x] = !gameBoard[y][x]
        puts "Toggled (" + (x+1).to_s + "," + (y+1).to_s + ")"
        
    when "print"
    
    end
    puts "--//--"
end
