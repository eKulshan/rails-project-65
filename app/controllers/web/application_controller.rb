# frozen_string_literal: true

class Web::ApplicationController < ApplicationController
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def authenticate_user!
    redirect_to root_path, flash: { alert: I18n.t('.auth.unauthenticated') } unless user_signed_in?
  end
end
