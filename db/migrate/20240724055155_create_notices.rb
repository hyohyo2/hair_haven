class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :notice_genre_id, null: false
      t.string :title, null: false
      t.text :detail, null: false

      t.timestamps
    end
  end
end
