class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'admin'
  before_filter :authenticate

  protected
   def authenticate
    unless (current_user) && (current_user.email == 'ilya@gmail.com')
         redirect_to(new_user_session_path)
      
     #unless ENV["RAILS_ENV"] == 'test'
     # authenticate_or_request_with_http_basic do |username, password|
     #   username == "admin" && password == "123123"
     # end
     end
   end
end
