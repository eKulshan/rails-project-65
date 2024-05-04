# frozen_string_literal: true

class Web::AuthController < ApplicationController
  def callback
    user_data = request.env['omniauth.auth'].info
    @user = User.find_or_create_by(email: user_data.email, name: user_data.name)
    session[:user_id] = @user.id

    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: I18n.t('.auth.sign_in.success') }
    else
      redirect_to root_path, flash: { error: I18n.t('.auth.sign_in.failure') }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { success: I18n.t('.auth.logout.success') }
  end
end
