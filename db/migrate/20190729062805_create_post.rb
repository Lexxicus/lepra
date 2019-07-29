class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :name
      t.text :post
      t.datetime :published_at
      t.timestamps
    end
  end
end
