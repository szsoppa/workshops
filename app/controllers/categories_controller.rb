class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :check_admin, only: [:new, :edit, :update, :destroy, :create]
  expose(:categories)
  expose(:category)
  expose(:product) { Product.new }


  def index
  end

  def show
    if params[:search]
      @products = category.products.select {|p| p if p.title.downcase.include?(params[:search].downcase) }
    else
      @products = category.products
    end
  end

  def new
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)
    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    ActiveRecord::Base.connection.execute("select update_category(#{category.id},'#{category_params["name"]}');")
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def check_admin
      if !current_user.admin?
        redirect_to new_user_session_path
      end
    end
end
