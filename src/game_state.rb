class GameState
  STATES = {
                      enden: 0,
                      in_menu: 1,
                      playing: 2,
                      inventory_opened: 3
                    }.freeze

  def transition_into(state)
    @current_state = STATES[(state.kind_of?(Integer) ? STATES.key(state) : state)]
  end

  def current_state
    STATES.key(@current_state)
  end

  def in_progress?
    current_state != STATES[:ended]
  end

  def end_game
    transition_into(:ended)
  end

  def open_inventory
    transition_into(:open_inventory)
  end

  def close_inventory
    transition_into(:playing)
  end
end