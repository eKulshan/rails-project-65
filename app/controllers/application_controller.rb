# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end
end
