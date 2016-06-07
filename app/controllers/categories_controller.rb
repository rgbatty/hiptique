class CategoriesController < ApplicationController

  def show
    puts params
    @category = Category.find_by(name: params[:category_name])
  end
end
