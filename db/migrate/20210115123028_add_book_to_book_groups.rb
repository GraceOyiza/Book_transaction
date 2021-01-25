class AddBookToBookGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :book_groups, :book, index: true
  end
end
