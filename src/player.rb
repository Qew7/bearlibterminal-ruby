class Player
  attr_accessor :x, :y
  attr_reader :name, :inventory

  def initialize
    @x = (Config::WINDOW_WIDTH / 2).to_i
    @y = (Config::WINDOW_HEIGHT / 2).to_i
    @name = 'Furunkle Garbung'
    @inventory = Inventory.new
  end

  def icon
    Config::PLAYER_ICON
  end
end