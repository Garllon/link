module Link
  class Player
    attr_reader :icon, :x, :y

    START_POINT_X = 50
    START_POINT_Y = 450
    STEP_WIDTH = 3

    def initialize(viewport_width:, viewport_height:)
      @viewport_width = viewport_width
      @viewport_height = viewport_height

      @x = START_POINT_X
      @y = START_POINT_Y
      @step_counter = 1
      @last_direction = 'down'

      @icon = build_icon('down', 1)
    end

    def draw
      icon
    end

    def move_left
      render_image('left')

      @x -= STEP_WIDTH
      @x = 0 if @x < 0
      sync_icon_position
    end

    def move_right
      render_image('right')

      @x += STEP_WIDTH
      @x = rightmost_position if @x > rightmost_position
      sync_icon_position
    end

    def move_up
      render_image('up')

      @y -= STEP_WIDTH
      @y = 0 if @y < 0
      sync_icon_position
    end

    def move_down
      render_image('down')

      @y += STEP_WIDTH
      @y = lowest_position if @y > lowest_position
      sync_icon_position
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

      @icon.remove
      @icon = build_icon(direction, @step_counter)
    end

    def rightmost_position
      @viewport_width - icon.instance_variable_get(:@img_width)
    end

    def lowest_position
      @viewport_height - icon.instance_variable_get(:@img_height)
    end

    def build_icon(direction, frame)
      Sprite.new("./images/#{direction}#{frame}.png", x: @x, y: @y)
    end

    def sync_icon_position
      @icon.x = @x
      @icon.y = @y
    end
  end
end
