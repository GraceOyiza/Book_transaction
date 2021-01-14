class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :amount
      t.integer :date
      t.integer :creator_id, class_name: 'User'
      
      t.timestamps
    end
  end
end
