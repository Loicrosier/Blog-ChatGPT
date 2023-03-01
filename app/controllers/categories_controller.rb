class CategoriesController < ApplicationController

  before_action :set_category, only: %i[ show ]

  def index
    @categories = Category.all
  end

  def show
    @sous_categories = @category.sous_categories
  end

  protected

  def set_category
    @category = Category.find(params[:id])
  end
end
