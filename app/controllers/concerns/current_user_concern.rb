module CurrentUserConcern
  extend ActiveSupport::Concern

  #override current_user
  #current user be available even no logged in
  def current_user
  	super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "no-mai;@mailer.com"
    guest
  end

end