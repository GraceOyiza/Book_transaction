class CreateBookGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :book_groups do |t|

      t.timestamps
    end
  end
end
