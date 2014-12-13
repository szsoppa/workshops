class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @lists = List.all
    respond_with(@lists)
  end

  def show
    respond_with(@list)
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.save
    respond_with(@list)
  end

  def update
    if product_params.empty?
      @list.update(list_params)
    elsif params[:add]
      @list.products << Product.find(params[:product]) if !@list.products.include?(Product.find(params[:product]))
      @list.save
    else
      @list.products.delete(Product.find(params[:product]))
      @list.save
    end
    respond_with(@list)
  end

  def destroy
    @list.destroy
    respond_with(@list)
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params[:list]
    end

    def product_params
      params[:product]
    end
end
