class AddCreatorToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :creator, index: true
  end
end
