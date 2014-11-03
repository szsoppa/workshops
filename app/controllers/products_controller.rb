class ProductsController < ApplicationController

  before_action :authenticate_user!

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
    flash[:error] = 'You are not allowed to edit this product.'
    redirect_to(category_product_url(category, product))
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if current_user != product.user
      flash[:error] = 'You are not allowed to edit this product.'
    elsif self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    end
    redirect_to category_product_url(category, product)
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
