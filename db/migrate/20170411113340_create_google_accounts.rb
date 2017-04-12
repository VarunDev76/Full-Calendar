class CreateGoogleAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :google_accounts do |t|
    	t.integer 		:user_id
    	t.string 		:token
    	t.string 		:refresh_token
      t.timestamps
    end
  end
end
