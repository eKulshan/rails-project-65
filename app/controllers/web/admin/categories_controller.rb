# frozen_string_literal: true

class Web::Admin::CategoriesController < Web::Admin::ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    authorize Category
    @categories = Category.all
  end

  def new
    authorize Category
    @category = Category.new
  end

  def edit
    authorize @category
  end

  def create
    authorize Category
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, flash: { success: I18n.t('.flash.category.create') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @category
    if @category.update(category_params)
      redirect_to admin_categories_path, flash: { success: I18n.t('flash.category.update') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @category
    @category.destroy
    redirect_to admin_categories_path, flash: { success: I18n.t('.flash.category.destroy') }
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
