class User < ApplicationRecord
  before_save :add_google_calender
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:google_oauth2]

	def self.from_omniauth(access_token)
	    data = access_token
	    binding.pry
     		where(provider: data.provider, uid: data.uid).first_or_create do |user|
	        user.email =  data.info.email
	        user.first_name =  data.info.first_name
	        user.last_name =  data.info.last_name
	        user.password = Devise.friendly_token[0,20]
	        user.token = data.credentials.token
          	user.refresh_token = data.credentials.refresh_token
	        user.username = data.info.name   # assuming the user model has a name
      	end
	end
  
  def login=(login)
		@login = login
	end

	def login
		@login || self.username || self.email
	end

end
