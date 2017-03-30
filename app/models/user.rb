class User < ApplicationRecord
  before_save :add_google_calender
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    devise :omniauthable, :omniauth_providers => [:google_oauth2]
  
  
  def add_google_calender
    cal = Google::Calendar.new(:client_id     => '460815436984-2iarb00t4oa5ctmkvqilol2lq4n52as7.apps.googleusercontent.com',:client_secret => 'B5PQc6OzPIzYudHVVD6SIZ6l',:calendar      => '3l2mfolmktn38s7304dtfa72hk@group.calendar.google.com',:redirect_url  => "urn:ietf:wg:oauth:2.0:oob")
    cal.login_with_refresh_token('1/jd4-2rWkKTvLjAGwsDjmDUGITYBCw5ttKkW8-o9aSHs')
    event = self
    # Home.all.each do |event| 
      cal.create_event do |e|
        e.title = event.name 
        e.start_time = event.starting_date #.strftime("%Y-%m-%d %H:%M:%S") #Time.now
        e.end_time = event.ending_date #.strftime("%Y-%m-%d %H:%M:%S") #Time.now + (60 * 60)
      end
    # end
  end

	def self.from_omniauth(access_token)
		binding.pry
	    data = access_token
     		where(provider: data.provider, uid: data.uid).first_or_create do |user|
	        user.email =  data.info.email
	        user.first_name =  data.info.first_name
	        user.last_name =  data.info.last_name
	        user.password = Devise.friendly_token[0,20]
	        user.token = data.credentials.token
          user.refresh_token = data.credentials.refresh_token
	        user.username = data.info.name   # assuming the user model has a name
	        # user.image = auth.info.image # assuming the user model has an image
	        # If you are using confirmable and the provider(s) you use validate emails, 
	        # uncomment the line below to skip the confirmation emails.
	        # user.skip_confirmation!
      	end
	end

  	def login=(login)
		@login = login
	end

	def login
		@login || self.username || self.email
	end

end
