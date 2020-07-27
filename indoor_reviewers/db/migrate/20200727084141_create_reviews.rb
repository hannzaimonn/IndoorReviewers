class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :image_id
      t.text :body
      t.integer :genre_id
      t.boolean :release
      t.integer :user_id

      t.timestamps
    end
  end
end
