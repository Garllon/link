module Link
  class Player
    attr_reader :window, :icon, :x, :y

    START_POINT_X = 50
    START_POINT_Y = 450
    STEP_WIDTH = 3

    def initialize(window)
      @window = window
      @icon = Gosu::Image.new(window, './images/down1.png', true)

      @x = START_POINT_X
      @y = START_POINT_Y
      @step_counter = 1
      @last_direction = 'down'
    end

    def draw
      icon.draw(x, y, 1)
    end

    def move_left
      render_image('left')

      return @x = 0 if x < 0
      @x -= STEP_WIDTH
    end

    def move_right
      render_image('right')

      @x += STEP_WIDTH
      return @x = rightmost_position if x > rightmost_position
    end

    def move_up
      render_image('up')

      return @y = 0 if @y < 0
      @y -= STEP_WIDTH
    end

    def move_down
      render_image('down')

      @y += STEP_WIDTH
      return @y = lowest_position if y > lowest_position
    end

    private

    def render_image(direction)
      if @last_direction == direction
        @step_counter += 1
        @step_counter = 1 if @step_counter == 4
      else
        @last_direction = direction
        @step_counter = 1
      end
      @icon = Gosu::Image.new(window, "./images/#{direction}#{@step_counter}.png", true)
    end

    def rightmost_position
      window.width - icon.width
    end

    def lowest_position
      window.height - icon.height
    end
  end
end
