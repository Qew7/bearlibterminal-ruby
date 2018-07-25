class Inventory
  def content
    [Item.new('Sword'), Item.new('Book')]
  end

  def size
    content.size
  end
end