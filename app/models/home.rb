class Home < ApplicationRecord
 before_save :add_google_calender
 attr_accessor :category

 def add_google_calender
    cal = Google::Calendar.new(:client_id => '460815436984-2iarb00t4oa5ctmkvqilol2lq4n52as7.apps.googleusercontent.com',:client_secret => 'B5PQc6OzPIzYudHVVD6SIZ6l',:calendar => '3l2mfolmktn38s7304dtfa72hk@group.calendar.google.com',:redirect_url => "urn:ietf:wg:oauth:2.0:oob")
    cal.login_with_refresh_token('1/jd4-2rWkKTvLjAGwsDjmDUGITYBCw5ttKkW8-o9aSHs')
    event = self
    # if event.event_id
			binding.pry
		rec= cal.find_or_create_event_by_id(event.event_id) do |e|
			e.title = event.name
			e.start_time = event.starting_date.strftime("%Y-%m-%d %H:%M:%S") #Time.now
			e.end_time = event.ending_date.strftime("%Y-%m-%d %H:%M:%S") #Time.now + (60 * 60)
		end
		event.event_id = rec.id
	# else
		
	# 	cal.create_event do |e|
	# 		e.title = event.name 
	# 		e.start_time = event.starting_date.strftime("%Y-%m-%d %H:%M:%S") #Time.now
	# 		e.end_time = event.ending_date.strftime("%Y-%m-%d %H:%M:%S") #Time.now + (60 * 60)
	# 	end
	# end
  end

end
