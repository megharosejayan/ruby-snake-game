require 'ruby2d'
set background: 'navy'
set fps_cap:1

#width = 640/20 = 32
#height = 480/20 = 20

GRID_SIZE = 20

class Snake
    def initialize
        @positions = [[2,0],[2,1],[2,2],[2,3]]
        @direction = 'down'
    end

    def draw
        @positions.each do |position|
            Square.new(x: position[0] * GRID_SIZE,y: position[1]*GRID_SIZE, size: GRID_SIZE-1, color: 'white')
        end
    end

    def move
        #removes the first element of positions array
        @positions.shift
        case @direction
        when 'down'
            @positions.push([head[0],head[1] + 1])
        end
    end

    def head
        @positions.last
    end

end

#to move the snake, add a new square at one end and remove the square at the other end

snake = Snake.new


update do
    clear
    snake.move
    snake.draw
end
show