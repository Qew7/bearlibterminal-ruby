class InventoryManager
  attr_reader :entity

  def initialize entity
    @entity = entity
  end

  def manage
    begin
      show_inventory
    end while Terminal.read != Terminal::TK_ESCAPE
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