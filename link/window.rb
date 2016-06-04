module Link
  class Window < Gosu::Window
    SCREEN_HEIGHT = 700
    SCREEN_WIDTH = 700

    def initialize
      super(SCREEN_HEIGHT, SCREEN_WIDTH, false)
      self.caption = 'A Legend of Link'

      @player           = Player.new(self)
      @running          = true
      @offset           = 0
    end

    def update
      handle_buttons
    end

    def draw
      @player.draw
    end

    private

    def handle_buttons
      case which_button
      when 'left' then @player.move_left
      when 'right' then @player.move_right
      when 'up' then @player.move_up
      when 'down' then @player.move_down
      when 'escape' then @running = false
      end
    end

    def which_button
      return 'left' if button_down? Gosu::Button::KbLeft
      return 'right' if button_down? Gosu::Button::KbRight
      return 'up' if button_down? Gosu::Button::KbUp
      return 'down' if button_down? Gosu::Button::KbDown
      return 'escape' if button_down? Gosu::Button::KbEscape
    end
  end
end
