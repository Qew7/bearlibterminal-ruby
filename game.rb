require './lib/BearLibTerminal'
require './config'
Dir['./src/*'].each {|file| require file }

class Game
  attr_accessor :input_handler, :player

  def start
    start_game
    setup
    mainloop
    finish
  end

  def end_game
    @game_in_progress = false
  end

  private

  def setup
    Terminal.open
    Terminal.set("window.title = '#{Config::TITLE}'")
    Terminal.set("font: assets/Fix15Mono-Bold.ttf, size=14x14")
    Terminal.set("window.size = #{Config::WINDOW_WIDTH}x#{Config::WINDOW_HEIGHT}")
    Terminal.refresh
    @input_handler = InputHandler.new self
    @player = Player.new
  end

  def mainloop
    while game_in_progress?
      @input_handler.handle Terminal.read
      Terminal.refresh
    end
  end

  def finish
    Terminal.close
  end

  def game_in_progress?
    @game_in_progress
  end

  def start_game
    @game_in_progress = true
  end
end
