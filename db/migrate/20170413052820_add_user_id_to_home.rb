class AddUserIdToHome < ActiveRecord::Migration[5.0]
  def change
  	add_column :homes , :user_id , :integer
  	add_column :homes , :username , :string
  end
end
