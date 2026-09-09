class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  # Show the form for creating a new product
  def new
    @product = Product.new
  end

  # Create a new product in the database
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Show the form for editing an existing product
  def edit
  end

  # Update an existing product in the database
  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete an existing product from the database
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

    # Find the product requested by the URL
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow the name and price fields to be submitted
    def product_params
      params.expect(product: [:name, :price])
    end
end