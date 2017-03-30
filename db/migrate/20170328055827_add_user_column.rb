class AddUserColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_index :users, :confirmation_token, unique: true
    execute("UPDATE users SET confirmed_at = NOW()")

  	add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :first_name , :string
  	add_column :users, :last_name , :string
  	add_column :users, :username , :string 
  	add_column :users, :token, :string

  end
end
