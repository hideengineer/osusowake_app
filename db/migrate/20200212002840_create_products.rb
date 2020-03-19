class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,             null: false
      t.text :description,        null: false
      t.integer :user_id
      t.integer :status,          null: false,default: 0
      t.integer :image_id
      t.timestamps
    end
  end
end
