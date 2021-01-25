class AddGroupToBookGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :book_groups, :group, index: true
  end
end
