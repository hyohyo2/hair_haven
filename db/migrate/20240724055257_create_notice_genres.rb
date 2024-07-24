class CreateNoticeGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :notice_genres do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
