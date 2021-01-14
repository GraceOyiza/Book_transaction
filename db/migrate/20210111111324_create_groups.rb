class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :creator_id, class_name: 'User'


      t.timestamps
    end
  end
end
