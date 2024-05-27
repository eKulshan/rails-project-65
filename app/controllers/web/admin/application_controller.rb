# frozen_string_literal: true

class Web::Admin::ApplicationController < Web::ApplicationController
  before_action :verify_admin_authorization

  def authorize(record, query = nil)
    super([:admin, record], query)
  end

  private

  def verify_admin_authorization
    redirect_to :root, status: :forbidden unless current_user.admin?
  end
end
