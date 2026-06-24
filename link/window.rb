module Link
  class Window
    SCREEN_HEIGHT = 700
    SCREEN_WIDTH = 700

    def initialize
      ::Window.set(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        title: 'A Legend of Link',
        resizable: false
      )

      @player = Player.new(viewport_width: SCREEN_WIDTH, viewport_height: SCREEN_HEIGHT)

      bind_events
    end

    def show
      ::Window.show
    end

    private

    def bind_events
      ::Window.on :key_held do |event|
        case event.key
        when 'left' then @player.move_left
        when 'right' then @player.move_right
        when 'up' then @player.move_up
        when 'down' then @player.move_down
        end
      end

      ::Window.on :key_down do |event|
        ::Window.close if event.key == 'escape'
      end
    end
  end
end
