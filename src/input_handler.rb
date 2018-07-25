class InputHandler
  attr_reader :game

  def initialize(gamestate)
    @game = gamestate
  end

  def handle(input)
    if exit_input?(input)
      game.end_game
    end
    if movement_input?(input)
      move(input)
    end
    if inventory_input?(input)
      InventoryManager.new(player).manage
    end
  end

  private

  def exit_input?(input)
    input == Terminal::TK_ESCAPE
  end

  def movement_input?(input)
    [Terminal::TK_LEFT, Terminal::TK_RIGHT, Terminal::TK_UP, Terminal::TK_DOWN].include? input    
  end

  def inventory_input?(input)
    input == Terminal::TK_I    
  end

  def move(input)
    Terminal.put player.x, player.y, ' '.to_u16_i
    player.x, player.y = case input
          when Terminal::TK_LEFT
            [player.x-1, player.y]
          when Terminal::TK_RIGHT
            [player.x+1, player.y]
          when Terminal::TK_UP
            [player.x, player.y-1]
          when Terminal::TK_DOWN
            [player.x, player.y+1]
          end
    Terminal.put player.x, player.y, player.icon.to_u16_i
  end

  def player
    game.player
  end
end