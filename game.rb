require './lib/BearLibTerminal'
require './config'
Dir['./src/*'].each {|file| require file }

class Game
  attr_accessor :input_handler, :player, :game_state

  def start
    setup
    start_game
    mainloop
    finish
  end

  def end_game
    @game_state.end_game
  end

  private

  def setup
    Terminal.open
    Terminal.set("window.title = '#{Config::TITLE}'")
    Terminal.set("font: assets/Fix15Mono-Bold.ttf, size=14x14")
    Terminal.set("window.size = #{Config::WINDOW_WIDTH}x#{Config::WINDOW_HEIGHT}")
    Terminal.refresh
    @game_state = GameState.new
    @input_handler = InputHandler.new(self)
    @player = Player.new
  end

  def start_game
    @game_state.transition_into(:playing)
  end

  def mainloop
    while game_in_progress?
      @input_handler.handle(Terminal.read)
      Terminal.refresh
    end
  end

  def finish
    Terminal.close
  end

  def game_in_progress?
    @game_state.in_progress?
  end
end
