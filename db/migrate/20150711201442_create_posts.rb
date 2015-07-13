class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
    	t.integer "author_id"
    	t.string "title"
    	t.text "content"
      t.timestamps null: false
    end
    add_index :posts, :author_id
  end

  def down
  	drop_table :posts
  end
end
