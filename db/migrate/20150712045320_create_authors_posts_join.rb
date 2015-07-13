class CreateAuthorsPostsJoin < ActiveRecord::Migration
  def up
    create_table :authors_posts do |t|
    	t.integer "author_id"
    	t.integer "post_id"
    end
    add_index :authors_posts, [:author_id, :post_id]
  end

  def down
  	drop_table :authors_posts
  end
end
