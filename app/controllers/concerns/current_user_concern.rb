module CurrentUserConcern
  extend ActiveSupport::Concern

  #override current_user
  #current user be available even no logged in
  def current_user
  	super || OpenStruct.new(name: 'Guest User', 
  							first_name: 'Guest', 
  							last_name: 'User', 
  							mail: 'no-email@mailer.com'
  							)
  end

end