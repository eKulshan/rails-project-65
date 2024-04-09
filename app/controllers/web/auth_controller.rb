# frozen_string_literal: true

class Web::AuthController < ApplicationController
  def callback
    user_data = request.env['omniauth.auth'].info
    @user = User.find_or_create_by(email: user_data.email, name: user_data.name)
    session[:user_id] = @user.id

    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to root_path, notice: I18n.t('.login.success')
    else
      redirect_to root_path, alert: I18n.t('.login.success')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: I18n.t('.logout.success')
  end
end
