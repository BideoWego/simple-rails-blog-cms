class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.integer "post_id"
    	t.integer "author_id", :null => true
    	t.text "content"
      t.timestamps null: false
    end
    add_index :comments, :post_id
    add_index :comments, :author_id
  end

  def down
  	drop_table :comments
  end
end
