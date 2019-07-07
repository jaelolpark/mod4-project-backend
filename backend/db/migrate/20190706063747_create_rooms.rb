class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :slug
      t.string :type

      t.integer :price
      t.integer :capacity

      t.boolean :pets
      t.boolean :breakfast
      t.boolean :featured

      t.text :description

      t.timestamps
    end
  end
end
