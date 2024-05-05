# frozen_string_literal: true

class Web::Admin::BulletinsController < Web::Admin::ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_bulletin, only: %i[show]

  def index
    @bulletins = Bulletin.order(created_at: :desc)
  end

  def show; end

  def new
    @bulletin = current_user.bulletins.build
  end

  def create
    @bulletin = current_user.bulletins.build(bulletin_params)

    if @bulletin.save
      redirect_to bulletin_url(@bulletin), flash: { success: I18n.t('.create') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bulletin
    @bulletin = Bulletin.find(params[:id])
  end

  def bulletin_params
    params.require(:bulletin).permit(:title, :description, :category_id, :image)
  end
end
