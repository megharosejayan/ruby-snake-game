require 'ruby2d'
set background: 'navy'
set fps_cap:20

#width = 640/20 = 32
#height = 480/20 = 20

GRID_SIZE = 20

class Snake
    attr_writer :directions
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
        when 'up'
            @positions.push([head[0],head[1] - 1])
        when 'left'
            @positions.push([head[0] - 1, head[1]])
        when 'right'
            @positions.push([head[0]+1, head[1]])
        end
    end

    private

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

on :key_down do |event|
    #puts event.key
    if ['up','down','left','right'].include?(event.key)
        snake.direction = event.key
    end
end

show