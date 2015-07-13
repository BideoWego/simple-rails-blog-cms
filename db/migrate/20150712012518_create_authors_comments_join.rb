class CreateAuthorsCommentsJoin < ActiveRecord::Migration
  def up
    create_table :authors_comments do |t|
    	t.integer "author_id"
    	t.integer "comment_id"
    end
    add_index :authors_comments, [:author_id, :comment_id]
  end

  def down
  	drop_table :authors_comments
  end
end
