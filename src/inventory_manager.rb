class InventoryManager
  attr_reader :entity, :game_state

  def initialize entity, game_state
    @entity = entity
    @game_state = game_state
    game_state.transition_into(:inventory_opened)
  end

  def manage
    begin
      show_inventory
    end while Terminal.read != Terminal::TK_ESCAPE
    game_state.transition_into(:playing)
  end

  private

  def show_inventory
    entity.inventory.content.each_with_index do |item, _i|
      Terminal.put 1, _i, '>'.to_u16_i
      Terminal.print 3, _i, item.name
    end
    Terminal.refresh
  end
end