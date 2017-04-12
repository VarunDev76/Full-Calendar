class CreateGoogleData < ActiveRecord::Migration[5.0]
  def change
    create_table :google_data do |t|
	    # t.string 		:confirmation_token,  unique: true
	    # execute("UPDATE users SET confirmed_at = NOW()")
	    # t.datetime 		:confirmed_at
	    # t.datetime 		:confirmation_sent_at
    	# t.string 		:provider
    	t.integer 		:user_id
    	# t.string 		:first_name
    	# t.string 		:last_name
    	# t.string 		:username
    	t.string 		:token
    	t.string 		:refresh_token
      t.timestamps
    end
  end
end
