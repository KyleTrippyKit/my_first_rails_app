class TestItemsController < ApplicationController
  before_action :set_test_item, only: %i[ show edit update destroy ]

  # GET /test_items or /test_items.json
  def index
    @test_items = TestItem.all
  end

  # GET /test_items/1 or /test_items/1.json
  def show
  end

  # GET /test_items/new
  def new
    @test_item = TestItem.new
  end

  # GET /test_items/1/edit
  def edit
  end

  # POST /test_items or /test_items.json
  def create
    @test_item = TestItem.new(test_item_params)

    respond_to do |format|
      if @test_item.save
        format.html { redirect_to @test_item, notice: "Test item was successfully created." }
        format.json { render :show, status: :created, location: @test_item }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @test_item.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /test_items/1 or /test_items/1.json
  def update
    respond_to do |format|
      if @test_item.update(test_item_params)
        format.html { redirect_to @test_item, notice: "Test item was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @test_item }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @test_item.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /test_items/1 or /test_items/1.json
  def destroy
    @test_item.destroy!

    respond_to do |format|
      format.html { redirect_to test_items_path, notice: "Test item was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_item
      @test_item = TestItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def test_item_params
      params.expect(test_item: [ :name ])
    end
end
