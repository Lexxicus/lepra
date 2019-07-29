class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.comment :newcomment
      t.datetime :published_at
      t.timestamps
    end
  end
end
