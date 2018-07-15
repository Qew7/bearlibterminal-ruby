require './lib/BearLibTerminal'
require './config'

class Main
  def perform
    setup
    mainloop
    finish
  end

  def setup
    Terminal.open
    Terminal.set("window.title = '#{Config::TITLE}'")
    Terminal.set("font: assets/Fix15Mono-Bold.ttf, size=14x14")
    Terminal.set("window.size = #{Config::WINDOW_WIDTH}x#{Config::WINDOW_HEIGHT}")
    Terminal.refresh
    @x, @y = [(Config::WINDOW_WIDTH/2).to_i, (Config::WINDOW_HEIGHT/2).to_i]
  end
  
  def mainloop
    while Terminal.read != Terminal::TK_ESCAPE
      if [Terminal::TK_LEFT, Terminal::TK_RIGHT, Terminal::TK_UP, Terminal::TK_DOWN].include? Terminal.read
        Terminal.put @x, @y, ' '.to_u16_i
        @x, @y = case Terminal.read
              when Terminal::TK_LEFT
                [@x-1, @y]
              when Terminal::TK_RIGHT
                [@x+1, @y]
              when Terminal::TK_UP
                [@x, @y-1]
              when Terminal::TK_DOWN
                [@x, @y+1]
              end
        Terminal.put @x, @y, '@'.to_u16_i
      end
      Terminal.refresh
    end
  end

  def finish
    Terminal.close
  end
end
