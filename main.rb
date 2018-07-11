require './lib/BearLibTerminal'
require './config'

class Main
  def perform
    setup
  end

  private

  def setup
    Terminal.open
    Terminal.set("window.title = '#{Config::TITLE}'")
    Terminal.set("font: assets/Fix15Mono-Bold.ttf, size=14x14")
    Terminal.set("window.size = #{Config::WINDOW_WIDGHT}x#{Config::WINDOW_HEIGHT}")
  end
end

Main.new.perform