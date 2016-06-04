module Link
  class Menu
    attr_reader :window, :menu_font
    attr_accessor :selection
    attr_writer :menu_action

    def initialize(window)
      @window = window

      @title = 'THE ASTEROIDER'
      @title_start = 'Start Game'
      @title_end = 'End Game'
      @selection = 1
      @menu_action = nil
      @menu_font = Gosu::Font.new(window, "Tahoma", window.height / 12)
      @title_font = Gosu::Font.new(window, "Tahoma", window.height / 8)
    end

    def draw
      hcolor = 0xffffd700
      scolor = 0xffc0c0c0

      @title_font.draw(@title, text_center(@title_font, @title), 155, 3, 1, 1, hcolor)
      @selection == 1 ? scolor = hcolor : scolor = 0xffc0c0c0
      @menu_font.draw(@title_start, text_center(@menu_font, @title_start), 355, 3, 1, 1, scolor)
      @selection == 2 ? scolor = hcolor : scolor = 0xffc0c0c0
      @menu_font.draw(@title_end, text_center(@menu_font, @title_end), 455, 3, 1, 1, scolor)
    end

    def update
      @menu_action
    end

    def button_down(id)
      if id == Gosu::Button::KbUp
        @selection -= 1
        if @selection < 1
          @selection = 2
        end
      elsif id == Gosu::Button::KbDown
        @selection += 1
        if @selection > 2
          @selection = 1
        end
      elsif id == Gosu::KbReturn
        @menu_action = 'start' if @selection == 1
        @menu_action = 'end' if @selection == 2
      end
    end

    private

    def text_center(font, text)
      ((window.width - font.text_width(text)) / 2)
    end
  end
end
