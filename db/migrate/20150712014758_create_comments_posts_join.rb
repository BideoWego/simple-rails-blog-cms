class CreateCommentsPostsJoin < ActiveRecord::Migration
  def up
    create_table :comments_posts do |t|
    	t.integer "comment_id"
    	t.integer "post_id"
    end
    add_index :comments_posts, [:comment_id, :post_id]
  end

  def down
  	drop_table :comments_posts
  end
end
