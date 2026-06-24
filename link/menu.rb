module Link
  class Menu
    attr_reader :window
    attr_accessor :selection
    attr_writer :menu_action

    def initialize(window)
      @window = window

      @title = 'THE ASTEROIDER'
      @title_start = 'Start Game'
      @title_end = 'End Game'
      @selection = 1
      @menu_action = nil

      @menu_size = window.height / 12
      @title_size = window.height / 8
      @title_text = build_text(@title, @title_size, 155)
      @start_text = build_text(@title_start, @menu_size, 355)
      @end_text = build_text(@title_end, @menu_size, 455)
    end

    def draw
      highlighted = '#ffd700'
      normal = '#c0c0c0'

      @title_text.color = highlighted
      @start_text.color = @selection == 1 ? highlighted : normal
      @end_text.color = @selection == 2 ? highlighted : normal
    end

    def update
      @menu_action
    end

    def button_down(id)
      if id == 'up'
        @selection -= 1
        if @selection < 1
          @selection = 2
        end
      elsif id == 'down'
        @selection += 1
        if @selection > 2
          @selection = 1
        end
      elsif id == 'return'
        @menu_action = 'start' if @selection == 1
        @menu_action = 'end' if @selection == 2
      end
    end

    private

    def build_text(text, size, y)
      drawable = Text.new(text, size: size, y: y, color: '#c0c0c0')
      drawable.x = text_center(drawable)
      drawable
    end

    def text_center(drawable)
      ((window.width - drawable.width) / 2)
    end
  end
end
