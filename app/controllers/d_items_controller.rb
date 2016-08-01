class DItemsController < ApplicationController
  before_action :set_d_item, only: [:show, :edit, :update, :destroy]

  # GET /d_items
  # GET /d_items.json
  def index
    @d_items = DItem.all
  end

  # GET /d_items/1
  # GET /d_items/1.json
  def show
  end

  # GET /d_items/new
  def new
    @d_item = DItem.new
  end

  # GET /d_items/1/edit
  def edit
  end

  # POST /d_items
  # POST /d_items.json
  def create
    @d_item = DItem.new(d_item_params)

    respond_to do |format|
      if @d_item.save
        format.html { redirect_to @d_item, notice: 'D item was successfully created.' }
        format.json { render :show, status: :created, location: @d_item }
      else
        format.html { render :new }
        format.json { render json: @d_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /d_items/1
  # PATCH/PUT /d_items/1.json
  def update
    respond_to do |format|
      if @d_item.update(d_item_params)
        format.html { redirect_to @d_item, notice: 'D item was successfully updated.' }
        format.json { render :show, status: :ok, location: @d_item }
      else
        format.html { render :edit }
        format.json { render json: @d_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /d_items/1
  # DELETE /d_items/1.json
  def destroy
    @d_item.destroy
    respond_to do |format|
      format.html { redirect_to d_items_url, notice: 'D item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_d_item
      @d_item = DItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def d_item_params
      params.require(:d_item).permit(:propuest_id, :item_id)
    end
end
