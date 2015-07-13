class CreateAuthors < ActiveRecord::Migration
  def up
    create_table :authors do |t|
    	t.string "first", :limit => 50
    	t.string "last", :limit => 50
    	t.string "username", :limit => 50
    	t.string "email", :default => "", :null => false
    	t.string "password_digest"
      t.timestamps null: false
    end
    add_index :authors, :username
  end

  def down
  	drop_table :authors
  end
end
