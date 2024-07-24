class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :kind, null: false, default: 0
      t.integer :size, default: 0
      t.integer :length, default: 0
      t.string :color
      t.text :detail, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
