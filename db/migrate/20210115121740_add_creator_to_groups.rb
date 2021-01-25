class AddCreatorToGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :creator, index: true
  end
end
