class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :do_realtime_token
  before_filter :do_realtime_user_id
  before_filter :do_realtime_server_url

  def do_realtime_token
  	@realtime_token = Digest::MD5.hexdigest("#{session[:session_id]}:#{realtime_user_id}")
  	return @realtime_token
  end

  def do_realtime_user_id
  	@realtime_user_id = realtime_user_id
  	return @realtime_user_id
  end

  def do_realtime_server_url
  	@realtime_server_url = realtime_server_url
  	return @realtime_server_url
  end

  def realtime_user_id
    return params[:user_id] # if using devise, change this to current_user.id
end

def realtime_server_url

    return "#{request.env["SERVER_NAME"]}:5001"
end
end
