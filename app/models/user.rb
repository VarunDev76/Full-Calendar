class User < ApplicationRecord
  # before_save :add_google_calender
  	has_one :google_account
  	has_many :homes
  	accepts_nested_attributes_for :google_account
  	accepts_nested_attributes_for :homes
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:google_oauth2]


	def self.from_omniauth(access_token)
	    data = access_token
	    # binding.pry
     		where(provider: data.provider, uid: data.uid).first_or_create do |user|
	        user.email =  data.info.email
	        user.first_name =  data.info.first_name
	        user.last_name =  data.info.last_name
	        user.password = Devise.friendly_token[0,20]
	        google_data = user.build_google_account(:user_id => data.uid, :refresh_token => data.credentials.refresh_token,  :token => data.credentials.token)  
	        user.token = data.credentials.token
          	user.refresh_token = data.credentials.refresh_token
	        user.username = data.info.name   # assuming the user model has a name
	        # home_data = user.homes.new(:user_id => data.uid, :username => data.username)
      	end
	end
  
  def login=(login)
		@login = login
	end

	def login
		@login || self.username || self.email
	end

end
