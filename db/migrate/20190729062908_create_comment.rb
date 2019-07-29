class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.text :name
      t.text :comment
      t.datetime :published_at
      t.timestamps
    end
  end
end
