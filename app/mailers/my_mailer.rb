class MyMailer < ActionMailer::Base

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new 'YOUR_MANDRILL_KEY'
	end
 

end
